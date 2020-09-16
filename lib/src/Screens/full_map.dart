import 'package:flutter/material.dart';
import 'package:fullscreen_google_map/src/DataLayer/models/UserInfo.dart';
import 'package:fullscreen_google_map/src/Screens/UserModal.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:fullscreen_google_map/main.dart';

import 'package:fullscreen_google_map/src/Screens/ExamplePage.dart';
import 'dart:math';

import 'package:logger/logger.dart';





class FullMapPage extends ExamplePage {
  FullMapPage()
      : super(const Icon(Icons.map), 'Full screen map');

  @override
  Widget build(BuildContext context) {
    return const FullMap();
  }
}

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {


  var logger = Logger(
    printer: PrettyPrinter(),
  );


  bool _myLocationEnabled = false;
  MyLocationTrackingMode _myLocationTrackingMode = MyLocationTrackingMode.Tracking;
  List<Object> _featureQueryFilter;



  // void _onMapCreated(MapboxMapController controller) {
  //   mapController = controller;
  // }



  // static final LatLng center = const LatLng(-33.86711, 151.1947171);
  MapboxMapController mapController;
  // MapboxMapController controller;
  // int _circleCount = 0;

  bool _locationSelected = false;
  double currentLatitude  = 0;
  double currentLongitude = 0;
  Circle _selectedCircle;

  void _onMapCreated(MapboxMapController controller) {
    // this.controller = controller;
    mapController= controller;
    mapController.onCircleTapped.add(_onCircleTapped);
  }

  @override
  void dispose() {
    mapController?.onCircleTapped?.remove(_onCircleTapped);
    super.dispose();
  }




  _navigateToModalPage(
      BuildContext context, CircleOptions z) async {



    // final blocG = BlocProvider.of<FoodGalleryBloc>(context);
    //
    // List<CheeseItem> tempCheeseItems = blocG.getAllCheeseItemsFoodGallery;
    // List<SauceItem> tempSauceItems = blocG.getAllSauceItemsFoodGallery;
    // List<NewIngredient> allExtraIngredients = blocG.getAllExtraIngredients;

    final UserInfo receivedUserInfo = await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration(milliseconds: 900),
        pageBuilder: (_, __, ___) =>
          //   BlocProvider<FoodItemDetailsBloc>(
          // bloc: FoodItemDetailsBloc(oneFoodItem, tempCheeseItems,
          //     tempSauceItems, allExtraIngredients),
          // child:
          UserModal(
              userPositionLatitude:z.geometry.latitude,
              userPositionLongitude:z.geometry.longitude,
              userName:''),

      ),
    );

    logger.w('returned value : -------------------------------------');


    print(' receivedUserInfo: ${receivedUserInfo.latitude}');
    print(' receivedUserInfo: ${receivedUserInfo.longitude}');
    print(' receivedUserInfo: ${receivedUserInfo.userName}');
    return Navigator.pop(context,receivedUserInfo);


    // receivedUserInfo


  }



  void _onCircleTapped(Circle circle) {

    logger.i('at _onCircleTapped');

    if (_selectedCircle != null) {
      _updateSelectedCircle(
        const CircleOptions(
            circleRadius: 60,
          circleColor: "#FFFF34",
        ),
      );
    }

    _navigateToModalPage(context,circle.options);


    setState(() {
      _selectedCircle = circle;
    });


    _updateSelectedCircle(
      CircleOptions(
        circleRadius: 30,
        circleColor: "#FFFF34",
        //yellow-- green...
      ),
    );




    

  }

  void _updateSelectedCircle(CircleOptions changes) {
    mapController.updateCircle(_selectedCircle, changes);
  }

  void _add2(double currentLatitude3, double currentLongitude3) async{


    Circle x = await mapController.addCircle(
      CircleOptions(
        geometry: LatLng(


            currentLatitude3,
            currentLongitude3
          // center.latitude + sin(_circleCount * pi / 6.0) / 20.0,
          // center.longitude + cos(_circleCount * pi / 6.0) / 20.0,
        ),
        circleColor: "#FF0000",
        circleRadius:15,

      ),
    );
    setState(
            () {
          _locationSelected = true;
          currentLatitude = currentLatitude3;
          currentLongitude = currentLongitude3;
          _selectedCircle = x;


          // _circleCount += 1;
        }
    );
  }
  void _add( double currentLatitude2, double currentLongitude2)  {
    if ((currentLatitude == 0) && (currentLongitude == 0)) {
      _add2(currentLatitude2,currentLongitude2);
    }
    else {

      logger.w('at else needs to update the circle....');


      mapController.removeCircle(_selectedCircle);

      _add2(currentLatitude2,currentLongitude2);
      setState(
              () {
            _locationSelected = true;
            currentLatitude = currentLatitude2;
            currentLongitude = currentLongitude2;


            // _circleCount += 1;
          }
      );



    }
  }



  void _remove() {
    mapController.removeCircle(_selectedCircle);
    setState(() {
      _selectedCircle = null;
      _locationSelected = false;
      // _circleCount -= 1;
    });
  }

  void _changePosition(double currentLatitude2, double currentLongitude2) {
    final LatLng current = _selectedCircle.options.geometry;
    // final Offset offset = Offset(
    //   center.latitude - current.latitude,
    //   center.longitude - current.longitude,
    // );
    _updateSelectedCircle(
      CircleOptions(
        geometry: LatLng(
          // currentLatitude:
          currentLatitude2,
          // currentLongitude:
          currentLongitude2,

          // center.latitude + offset.dy,
          // center.longitude + offset.dx,
        ),
      ),
    );
  }

  void _changeDraggable() {
    bool draggable = _selectedCircle.options.draggable;
    if (draggable == null) {
      // default value
      draggable = false;
    }
    _updateSelectedCircle(
      CircleOptions(
        draggable: !draggable,
      ),
    );
  }

  void _getLatLng() async {
    LatLng latLng = await mapController.getCircleLatLng(_selectedCircle);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(latLng.toString()),
      ),
    );
  }

  void _changeCircleStrokeOpacity() {
    double current = _selectedCircle.options.circleStrokeOpacity;
    if (current == null) {
      // default value
      current = 1.0;
    }

    _updateSelectedCircle(
      CircleOptions(circleStrokeOpacity: current < 0.1 ? 1.0 : current * 0.75),
    );
  }

  void _changeCircleStrokeWidth() {
    double current = _selectedCircle.options.circleStrokeWidth;
    if (current == null) {
      // default value
      current = 0;
    }
    _updateSelectedCircle(CircleOptions(circleStrokeWidth: current == 0 ? 5.0 : 0));
  }

  Future<void> _changeCircleStrokeColor() async {
    String current = _selectedCircle.options.circleStrokeColor;
    if (current == null) {
      // default value
      current = "#FFFFFF";
    }

    _updateSelectedCircle(
      CircleOptions(circleStrokeColor: current == "#FFFFFF" ? "#FF0000" : "#FFFFFF"),
    );
  }

  Future<void> _changeCircleOpacity() async {
    double current = _selectedCircle.options.circleOpacity;
    if (current == null) {
      // default value
      current = 1.0;
    }

    _updateSelectedCircle(
      CircleOptions(circleOpacity: current < 0.1 ? 1.0 : current * 0.75),
    );
  }

  Future<void> _changeCircleRadius() async {
    double current = _selectedCircle.options.circleRadius;
    if (current == null) {
      // default value
      current = 0;
    }
    _updateSelectedCircle(
      CircleOptions(circleRadius: current == 120.0 ? 30.0 : current + 30.0),
    );
  }

  Future<void> _changeCircleColor() async {
    String current = _selectedCircle.options.circleColor;
    if (current == null) {
      // default value
      current = "#FF0000";
    }

    _updateSelectedCircle(
      CircleOptions(
          circleColor: "#FFFF00"),
    );
  }

  Future<void> _changeCircleBlur() async {
    double current = _selectedCircle.options.circleBlur;
    if (current == null) {
      // default value
      current = 0;
    }
    _updateSelectedCircle(
      CircleOptions(circleBlur: current == 0.75 ? 0 : 0.75),
    );
  }


  @override
  Widget build(BuildContext context) {

    var logger = Logger(
      printer: PrettyPrinter(),
    );



    return new Scaffold(
        body: MapboxMap(
          accessToken: MyApp.ACCESS_TOKEN,
          onMapCreated: _onMapCreated,

          myLocationEnabled: _myLocationEnabled,
          myLocationTrackingMode: _myLocationTrackingMode,
          myLocationRenderMode: MyLocationRenderMode.GPS,

          /*
          initialCameraPosition: const CameraPosition(
            target: LatLng(-33.852, 151.211),
            zoom: 11.0,
          ),

          */



          initialCameraPosition:
          const CameraPosition(target: LatLng(0.0, 0.0)),



          onMapClick: (point, latLng) async {
            print("Map click: ${point.x},${point.y}   ${latLng.latitude}/${latLng.longitude}");
            print("Filter $_featureQueryFilter");
            List features = await mapController.queryRenderedFeatures(point, [], _featureQueryFilter);
            if (features.length>0) {
              print(features[0]);
            }
          },


          onMapLongClick: (point, latLng) async {

            // I/flutter (11083): Map long press: 589.0,778.6500244140625   23.7971735819156/90.33995582408755
            // I/flutter (11083): Map long press converted: 589.0,778.6500244140625   23.7971735819156/90.33995582408755

            print("Map long press: ${point.x},${point.y}   ${latLng.latitude}/${latLng.longitude}");
            Point convertedPoint = await mapController.toScreenLocation(latLng);
            LatLng convertedLatLng = await mapController.toLatLng(point);
            print("Map long press converted: ${convertedPoint.x},${convertedPoint.y}  "
                " ${convertedLatLng.latitude}/${convertedLatLng.longitude}");


            _add(convertedLatLng.latitude,convertedLatLng.longitude);


            List features = await mapController.queryRenderedFeatures(point, [], null);
            if (features.length>0) {
              print(features[0]);
            }

            // onPressed: (_circleCount == 12) ? null :


          },


        )
    );
  }
}
