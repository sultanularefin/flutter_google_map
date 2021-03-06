import 'package:flutter/material.dart';
// import 'package:fullscreen_google_map/src/BLoC/bloc_provider.dart';
import 'package:fullscreen_google_map/src/Bloc/bloc_provider.dart';
import 'package:fullscreen_google_map/src/Bloc/home_bloc.dart';
import 'package:fullscreen_google_map/src/welcomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  //FIXME: Add your Mapbox access token here
  // static const String ACCESS_TOKEN = "YOUR_TOKEN_HERE";

  static const String ACCESS_TOKEN = "sk.eyJ1IjoiYXJlZmluc3VsdGFuIiwiYSI6ImNrZjJsZHZudTEzbGwyeXBoaHV4am85YzgifQ.JtyBQWqa8pG6vHH9KsIUNA";



  @override
  Widget build(BuildContext context) {
    return
      BlocProvider<HomeBloc>(
        bloc: HomeBloc(),

        child: MaterialApp(

          // return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: WelcomePage(
            /*title: 'Flutter Demo Home Page' */
          ),
        ),
      );
  }
}

/*

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      */
    );
  }
}
*/