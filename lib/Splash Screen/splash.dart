import 'dart:async';
import 'package:codingo/LogIn%20Signup/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => logIn())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 0.4,
              "assets/Images/CodinGo Logo.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Codin",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                SizedBox(width: 2),
                Text(
                  "Go",
                  style: TextStyle(
                    color: Color(0xffd00000),
                    fontFamily: "Poppins",
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
