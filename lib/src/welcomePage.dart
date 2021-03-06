



// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fullscreen_google_map/src/Bloc/bloc_provider.dart';
import 'package:fullscreen_google_map/src/Bloc/home_bloc.dart';


import 'package:fullscreen_google_map/src/DataLayer/models/UserInfo.dart';
import 'package:fullscreen_google_map/src/Screens/full_map.dart';

// import 'package:fullscreen_google_map/src/identity/loginPage.dart';

import 'package:fullscreen_google_map/src/utilities/screen_size_reducers.dart';

//TODO STATE ful widget not required
//class MyApp extends StatelessWidget {

/*  Block related Files BELOW */

// import 'package:fullscreen_google_map/src/BLoC/bloc_provider.dart';
// import 'package:fullscreen_google_map/src/BLoC/ho.dart';
// import 'package:fullscreen_google_map/src/screens/foodGallery/foodgallery2.dart';

// import 'package:fullscreen_google_map/src/BLoC/foodGallery_bloc.dart';

import 'package:permission_handler/permission_handler.dart';



/*  Block related Files ABOVE */


class WelcomePage extends StatefulWidget {

  // final String fromWhicPage;
  final String title;
  WelcomePage({Key key,
    this.title
  }) : super(key: key);


  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  _WelcomePageState();


  /*
  @override
  void initState(){

    // possible scenarios:


    // 1. no local storage, (app deleted and reinstalled || or first time user ) go to Login page.
    // MORE AT HERE : localStorageCheck();

    // 2. if the email found in loCAL STORAGE, LOCAL STORAGE ARE CREATED ONLY WHEN SUCCESSFUL LOGIN WERE MADE WITH
    // CERTAIN EMAIL AND PASSWORD.
    // THUS THERE COULD BE 2 SCENARIOS{
    /*
     1. CHECK WITH THIS CREDENTIALS WITH FIRE BASE AUTH IF SUCCESS GO TO FIREBASE PAGE.
     2. ADMIN CAN DELETE THE USER FROM FIREBASE AUTH LIST THEN USER CAN'T LOGIN AND HE NEEDS TO LOGIN AGAIN WITH THE
     ADMIN RPOVIDE USER NAME AND PASSWROD.

     3. I THINK I IMPLEMENTED ALL BUT SOME NETWORKING RELATED CODE LIKE connectionState etc needs to be checked again.
     in the future (might not need now.).

     */

    localStorageCheck();

    //  this requred since stream can only handle one kind of variale. In this page FirebaseUser.

    //  // check paper why we need it.
    // check the data Type at here.
    /*
    stream: identityBloc.getCurrentFirebaseUserStream,
            initialData: identityBloc.getCurrentFirebaseUser,
    */

    super.initState();

  }
  */

  /*

  // Future<void> return type .  ??
  Future<void> localStorageCheck (String fromWhichPageString) async{

    final homeBlockinInitState = BlocProvider.of<HomeBloc>(context);

    bool x= await homeBlockinInitState.checkUserinLocalStorage();

    if ((x==false) && (fromWhichPageString=='foodGallery2')){

      return Navigator.push(

          context, MaterialPageRoute(builder: (context) => LoginPage(showSnackbar0:true))

      );
    }
    else if (x==false){

      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())
      );
    }

    else{
      return;
    }

  }

  */







  @override
  Widget build(BuildContext context) {
//    logger.e('at build of welcome page');

    UserInfo currentUser = new UserInfo();


    final homeBlocUserInfo = BlocProvider.of<HomeBloc>(context);



    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: StreamBuilder<UserInfo>(

            initialData: homeBlocUserInfo.getNewUserInfo,
            stream: homeBlocUserInfo.userInfoStream,
            builder: (context, snapshot) {
//              switch (snapshot.connectionState){
//                case ConnectionState.waiting:
//                case ConnectionState.none:
//                return Center(
//                  child: Column(
//                    children: <Widget>[
//
//                      Center(
//                        child: Container(
//                            alignment: Alignment.center,
//                            child: new CircularProgressIndicator(
//                                backgroundColor: Colors.lightGreenAccent)
//                        ),
//                      ),
//                      Center(
//                        child: Container(
//                            alignment: Alignment.center,
//                            child: new CircularProgressIndicator(
//                              backgroundColor: Colors.yellow,)
//                        ),
//                      ),
//                      Center(
//                        child: Container(
//                            alignment: Alignment.center,
//                            child: new CircularProgressIndicator(
//                                backgroundColor: Colors.redAccent)
//                        ),
//                      ),
//                    ],
//                  ),
//                );
//                case ConnectionState.active:
//                case ConnectionState.done:
//              }
//              if(snapshot.error){
//                return  Center(
//                  child: Container(
//                    alignment: Alignment.center,
//                    child: Text('something went wrong'),
//                  ),
//                );
//              }

              //   print('snapshot.hasData: ${snapshot.hasData}');


              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('something went wrong'),
                  ),
                );
              }


              /*
              if (snapshot.hasData) {
                print('snapshot.hasData is ${snapshot
                    .hasData} in Welcome page ');

                if (snapshot.data is FirebaseUser) {
                  /*
                return
                  BlocProvider<FoodGalleryBloc>(
                    bloc: FoodGalleryBloc(),
                    child: FoodGallery2(),
                  );
                */

                  print('  :: ::  snapshot.data is FirebaseUser');

                  FoodItemWithDocID emptyFoodItemWithDocID = new FoodItemWithDocID();


//                  List<NewIngredient> _allIngredientState = [];
//                  List<NewIngredient> emptyIngs = [];


//                  final bloc = BlocProvider2.of(context).getFoodGalleryBlockObject;


//                  FoodItemWithDocID oneFoodItem, List<NewIngredient> allIngsScoped, {int fromWelComePage=0
                  return (

                      BlocProvider<FoodGalleryBloc>(
                          bloc: FoodGalleryBloc(),
                          child: FoodGallery2()

                      )
                  /*
                      BlocProvider2(/*thisAllIngredients2:welcomPageIngredients, */
                          bloc2: AppBloc(
                              emptyFoodItemWithDocID, []),
                          /*
                          child: BlocProvider<FoodItemDetailsBloc>(
                              bloc:FoodItemDetailsBloc(emptyFoodItemWithDocID,emptyIngs ,fromWhichPage:0),
                              child: FoodGallery2()

                          )
                          */
                          child: FoodGallery2()
                      )

                      */

                  );
                }
                else {
                  return LoginPage();
                }
              }
              */
              else {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      margin: EdgeInsets.fromLTRB(
                          0, displayHeight(context) / 2, 0, 0),
                      child: Center(
                        child: Column(
                          children: <Widget>[

                            Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: new CircularProgressIndicator(
                                      backgroundColor: Colors.lightGreenAccent)
                              ),
                            ),
                            Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: new CircularProgressIndicator(
                                    backgroundColor: Colors.yellow,)
                              ),
                            ),
                            Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: new CircularProgressIndicator(
                                      backgroundColor: Colors.redAccent)
                              ),
                            ),
                          ],
                        ),
                      ),

                    );
                    break;
                  case ConnectionState.active:

                  default:


                    if(snapshot.data is UserInfo) {
                      UserInfo one = snapshot.data;
                      return


                        Container(
                          child:
                          unEditableUserInfoHomePage(one, context),
                          // Text('User Info data found can be null!!!'),
                        );
                    }
                    else{
                      return Column(
                        children: [
                          new CircularProgressIndicator(),
                          Container(child: Text('something went wrong || loading........ ...'),),
                          new CircularProgressIndicator(),
                        ],
                      );
                    }
                }
              }
            }
        ),

      ),

    );
  }

  Widget unEditableUserInfoHomePage(
      UserInfo currentUser, BuildContext context) {
    return Container(
      // color:Colors.blue,
      height: (

      displayHeight(context) -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom)/1.3,
/* displayHeight(context) / 20 is the header of category of search || like pizza and /14 is the
      * container holding the logo*/
      child:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('your current location\'s latitude: ${currentUser.latitude}'),

            SizedBox(height: 20,),
            Text('your current location\'s longitude: ${currentUser.longitude}'),
            SizedBox(height: 20,),
            Text('Your name: ${currentUser.userName}'),
            SizedBox(height: 40,),
            Container(
              width: displayWidth(context) / 2,
              height: displayHeight(context) / 12,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Container(
//              alignment: Alignment.center,
                  child: Text(
                    //'peruuta'.toUpperCase(),
                    'update your location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  print(' update button pressed to update locatoin ....');

                 return _navigateAndDisplaySelection(context);
//                  return Navigator.pop(context,cancelPaySelect);

//                  return Navigator.pop(context,expandedFoodReturnTemp);
                },
              ),
            ),

            SizedBox(height: 100,),
            Container(

              width: displayWidth(context) / 1.1,
              height: 110,
                  //displayHeight(context) / 2,

              decoration: BoxDecoration(
                border: Border.all(
                  color:Colors.blue,

                  style: BorderStyle.solid,
                  width: 2.0,
                ),
                shape: BoxShape.rectangle,
              ),

                  child: Text(
                    //'peruuta'.toUpperCase(),
                    'to update: please long press on the map to invoke the marker, which is red,'
                        'then tap on the marker, to invoke a modal where you can write your name and hit the'
                        'submit button',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,

                      fontSize: 13,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),



          ],
        )




    );
  }

  _navigateAndDisplaySelection(
      BuildContext context) async {




//          final Permission permission= Permission.contacts;
    final Permission permission= Permission.location;
    print('at Future<void> requestPermission $permission');

    final status = await permission.request();

    print('status: $status');

    switch (status) {
      case PermissionStatus.granted:
        print('PermissionStatus.granted');
        // do something
        break;
      case PermissionStatus.denied:
        print('PermissionStatus.denied');
        // do something
        break;
      case PermissionStatus.restricted:
        print('PermissionStatus.restricted');
        // do something
        break;
      case PermissionStatus.permanentlyDenied:
        print('PermissionStatus.permanentlyDenied');
        // do something
        break;
      case PermissionStatus.undetermined:
        print('PermissionStatus.undetermined');
        // do something
        break;
      default:
    }


    final UserInfo receivedUserInfo = await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration(milliseconds: 900),
        pageBuilder: (_, __, ___) =>

            Scaffold(
              appBar: AppBar(title: Text('please select your location')),
              body: FullMap(),
            )

        ),

    );


// After the Selection Screen returns a result, hide any previous snackbars
// and show the new result.

    if (receivedUserInfo != null) {
//      print('| | | | | | | |   receivedSelectedFood.quantity: ${receivedSelectedFood.quantity}');

      print(
          '| | | | | | | |   received_LocatoinInformations: ${receivedUserInfo}');

      final homeBlocUserInfo = BlocProvider.of<HomeBloc>(context);



      homeBlocUserInfo.updateThisUserInfo(
          receivedUserInfo);

      // homeBlocUserInfo





      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: Text("${receivedUserInfo.userName}: we got your location.")));


//      setState(() => _reloadRequired = true);




    } else {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("selected 0 items")));
    }
  }
}



