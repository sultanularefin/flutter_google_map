
import 'package:fullscreen_google_map/src/BLoC/bloc.dart';
import 'package:fullscreen_google_map/src/DataLayer/api/firebase_clientAdmin.dart';

// import 'package:fullscreen_google_map/src/DataLayer/models/NewIngredient.dart';


import 'package:fullscreen_google_map/src/DataLayer/models/UserInfo.dart';



import 'package:logger/logger.dart';


import 'dart:async';


class HomeBloc implements Bloc {

  var logger = Logger(
    printer: PrettyPrinter(),
  );



  List<UserInfo> _allFoodsList=[];


  bool _isDisposedConstructorMapInHomePage =false;

  final _client = FirebaseClientAdmin();

  List<UserInfo> get allFoodItems => _allFoodsList;

  final _foodItemController = StreamController <List<UserInfo>>();


  Stream<List<UserInfo>> get foodItemsStream => _foodItemController.stream;




//  Future<List<UserInfo>> getAllFoodItems() async {
  void getUserLocationFromGoogleMapConstructor() async {

    print('at getAllFoodItemsConstructor()');

//    _isDisposedFoodItems = true;
    if(_isDisposedConstructorMapInHomePage == true) {
      return;
    }
    else {

      var snapshot = await _client.invokeMap();

      List<UserInfo> tempAllFoodsList= new List<UserInfo>();
      snapshot.docs.forEach((doc) {

        Map getDocs = doc.data();

        final String foodItemName = getDocs ['name'];

        final String foodItemDocumentID = doc.id;



        print('\n\n\n');



        UserInfo oneUserInfo = new UserInfo(
            latitude: '',
            longitude: '',
            userName: '',
        );

        tempAllFoodsList.add(oneUserInfo);
      }
      );


      _allFoodsList= tempAllFoodsList;

      _foodItemController.sink.add(_allFoodsList);
      _isDisposedConstructorMapInHomePage = true;

    }
  }





  // CONSTRUCTOR BIGINS HERE..
  HomeBloc() {

    print('at HomeBlocc()');



//    getAllIngredientsConstructor();

    // getAllExtraIngredientsConstructor();

    getUserLocationFromGoogleMapConstructor();



    // need to use this when moving to food Item Details page.


    print('at FoodGalleryBloc()');


  }

  // CONSTRUCTOR ENDS HERE..




  // 4
  @override
  void dispose() {
    _foodItemController.close();

    // _allExtraIngredientItemsController.close();

  }
}