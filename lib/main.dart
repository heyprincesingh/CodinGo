import 'package:codingo/Home/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Splash Screen/splash.dart';

////////////////////////////////////////////////////////////////////////////////////////
import 'package:codingo/Coding%20Contests/contest.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if (snapshot.hasError){
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            theme: ThemeData(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
              accentColor: Colors.black54,
            ),
            debugShowCheckedModeBanner: false,
            title: 'CodinGo',
            home: homeScreen(),//SplashScreen(),
          );
        });
  }
}
