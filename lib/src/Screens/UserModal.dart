

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen_google_map/src/DataLayer/models/UserInfo.dart';

import 'package:logger/logger.dart';
import 'package:fullscreen_google_map/src/utilities/screen_size_reducers.dart';



class UserModal extends StatefulWidget {

  final Widget child;

  final double userPositionLatitude;

  final double userPositionLongitude;
  // final CircleOptoins
  final String userName;

  // Todo(this.title, this.description);



  UserModal({Key key, this.child, this.userPositionLatitude,this.userPositionLongitude,this.userName}) :
        super(key: key);

  @override
  _UserModalState createState() => new _UserModalState(
      userLatitude:userPositionLatitude,
      userLongitude:userPositionLongitude,
      userName2:userName);


}

class _UserModalState extends State<UserModal> {


  _UserModalState({this.userLatitude,this.userLongitude,this.userName2});

//  final Stream<QuerySnapshot> x2;



  final double userLatitude;
  final double userLongitude;
  String userName2;

  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
  final userNameController = TextEditingController();


  var logger = Logger(
    printer: PrettyPrinter(),
  );

  String _currentSize;

  double priceBySize = 0.0;
  double priceBasedOnCheeseSauceIngredientsSizeState = 0.0;

  List<String> allSubGroups1 = new List<String>();

  bool showUnSelectedIngredients = false;
  bool showPressWhenFinishButton = false;

  @override
  Widget build(BuildContext context) {




                return GestureDetector(
                  onTap: () {
                    print('s');
                    print('navigating to FoodGallery 2 again with block');

                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
//                  Navigator.pop(context);

                  }

                    UserInfo returning = new UserInfo(
                      latitude:userLatitude,
                      longitude:userLongitude,
                      userName:userName2,
                    );


                    print(
                        'CLEAR SUBSCRIPTION ... before going to food gallery page..');
                    // blocD.clearSubscription();

                    return Navigator.pop(context,returning);
                  },
                  child: Scaffold(
                    backgroundColor: Colors.white.withOpacity(0.05),
                    // this is the main reason of transparency at next screen.
                    // I am ignoring rest implementation but what i have achieved is you can see.

                    body: SafeArea(
                      // smaller container containing all modal FoodItem Details things.
                      child: Container(
                          height: displayHeight(context) -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom,
//                            kToolbarHeight

                          child: GestureDetector(
                            onTap: () {
                              print('GestureDetector for Stack working');
                              print('no navigation now');
                            },
                            child: Container(
                              // FROM 2.3 ON JULY 3 AFTER CHANGE INTRODUCTION OF CHEESE AND SAUCES.
                              width: displayWidth(context) / 1.01,

                              child: initialView()),
                            ),
//
                          )),
                    ),

                );
              }



  Widget inputFieldsDelivery(double userLatitude3, double userLongitude3,String userName3) {


    // final double userLatitude3;
    // final double userLongitude3;
    // final String userName3;

    return Container(
//        color:Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              decoration: BoxDecoration(
//                                      shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xffBCBCBD),
                  style: BorderStyle.solid,
                  width: 2.0,
                ),

                boxShadow: [
                  BoxShadow(
                      color: Color(0xffFFFFFF),
                      blurRadius: 10.0,
                      offset: Offset(0.0, 2.0))
                ],
                color: Color(0xffFFFFFF),

              ),

//                                  color: Color(0xffFFFFFF),
              width: displayWidth(context) / 1.3,
              height: displayHeight(context) / 12,
              padding:
              EdgeInsets.only(left: 4, top: 3, bottom: 3, right: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
//                                            height: 25,
                    height: displayHeight(context) / 40,
                    width:105,
                    margin: EdgeInsets.only(left: 0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_off,
                          size: 28,
                          color: Color(0xffBCBCBD),
                        ),
                        Text('latitude:    '),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: displayWidth(context) / 4,
//                                        color:Colors.purpleAccent,
                    // do it in both Container
                    child: TextField(
                      enabled: false,
                      controller: latitudeController,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        focusColor: Color(0xffFC0000),
                        border: InputBorder.none,
                        // hintText: 'katuosoite ja talon numero ',
                        hintText: '$userLatitude3',
                        hintStyle: TextStyle(
                            color: Colors.black54, fontSize: 14),

                      ),



                      style: TextStyle(
                          color: Color(0xffFC0000), fontSize: 16),
                    ),
                  )
                ],
              ),
            ),


          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            decoration: BoxDecoration(
//                                      shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xffBCBCBD),
                style: BorderStyle.solid,
                width: 2.0,
              ),

              boxShadow: [
                BoxShadow(
//                                            color: Color.fromRGBO(250, 200, 200, 1.0),
                    color: Color(0xffFFFFFF),
                    blurRadius: 10.0,
                    offset: Offset(0.0, 2.0))
              ],

              color: Color(0xffFFFFFF),
//                                      Colors.black54
            ),

//                                  color: Color(0xffFFFFFF),
            width: displayWidth(context) / 1.3,
            height: displayHeight(context) / 12,
            padding:
            EdgeInsets.only(left: 4, top: 3, bottom: 3, right: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
//                                            height: 25,
                  height: displayHeight(context) / 40,
                  width:105,
                  margin: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [

                      Icon(
                        Icons.edit_off,
                        size: 28,
                        color: Color(0xffBCBCBD),
                      ),
                      Text('longitude:    '),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: displayWidth(context) / 4,
//                                        color:Colors.purpleAccent,
                  // do it in both Container
                  child: TextField(
                    enabled: false,
                    controller: longitudeController,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) =>
                        FocusScope.of(context).nextFocus(),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusColor: Color(0xffFC0000),
                      border: InputBorder.none,
                      // hintText: 'katuosoite ja talon numero ',
                      hintText: '$userLongitude3',
                      hintStyle: TextStyle(
                          color: Colors.black54, fontSize: 14),

                    ),



                    style: TextStyle(
                        color: Color(0xffFC0000), fontSize: 16),
                  ),
                )
              ],
            ),
          ),


       Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                decoration: BoxDecoration(
//                                      shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xffBCBCBD),
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),

                  boxShadow: [
                    BoxShadow(

                        color: Color(0xffFFFFFF),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 2.0))
                  ],
                  color: Color(0xffFFFFFF),
                ),

                width: displayWidth(context) / 1.3,
                height: displayHeight(context) / 12,
                padding:
                EdgeInsets.only(left: 4, top: 3, bottom: 3, right: 3),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: displayHeight(context) / 40,
                      width: 5,
                      margin: EdgeInsets.only(left: 0),
                      child: Icon(
                        Icons.edit,
                        size: 28,
                        color: Color(0xffBCBCBD),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: displayWidth(context) / 4,
                      child: TextField(
                        controller: userNameController,
                        textInputAction: TextInputAction.done,
                        // onEditingComplete: FocusScope.of(context).nextFocus,
                        onSubmitted: (_) =>
                            FocusScope.of(context).nextFocus(),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintText: 'asunto numero',
                          hintText: 'your name',
                          hintStyle: TextStyle(
                              color: Colors.black54, fontSize: 14),

                        ),
                        onChanged: (text) {

                          setState(() {
                            userName2=text;

                          });
                          // NECESSARY TO SHRINK THE SELECTED ORDER WIDGET.
                        },
                        onTap: () {

                          print('on tap of username input ...');
                        },
                        onEditingComplete: () {
                          print(
                              'at editing complete of your name update... ');
                        },
                        style: TextStyle(
                            color: Color(0xffFC0000), fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
        ],
      ),
    );
  }


  Widget initialView() {

    return Container(

      height: displayHeight(context) -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom,
      width: displayWidth(context) / 1.2,
//                  color:Colors.lightGreen,
      margin: EdgeInsets.fromLTRB(20, displayHeight(context) / 10, 20, 45),

      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
//                                    color: Colors.purple,
        color: Colors.white,
      ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            inputFieldsDelivery(userLatitude,userLatitude,userName2),


            SizedBox(
              height
                  : displayWidth(context) / 12,
            ),


            Container(
              width: displayWidth(context) / 1.3,
              height: displayHeight(context) / 15,
              child: RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Container(
//              alignment: Alignment.center,
                  child: Text(
                    //'peruuta'.toUpperCase(),
                    'submit'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  print(
                      'submit button pressed....');


                  UserInfo returning = new UserInfo(
                    latitude:userLatitude,
                    longitude:userLongitude,
                    userName:userName2,
                  );


                  print(
                      'CLEAR SUBSCRIPTION ... before going to food gallery page..');
                  return Navigator.pop(context,returning);

                },
              ),
            ),

          ],
        ),

    );
  }


}

