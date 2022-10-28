import 'package:flutter/material.dart';

import '../LogIn Signup/signUpOtpDetail.dart';

class notification extends StatelessWidget {
  const notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
        titleTextStyle: TextStyle(letterSpacing: 1.5),
        title: Text(
          "Notification",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_active,
              size: MediaQuery.of(context).size.width / 4,
              color: Colors.white38,
            ),
            SizedBox(height: 10),
            Text(
              "You need to Sign Up first",
              style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "Tondo-light",),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffd00000),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => signUpDetails())),
              child: Text("Sign Up",
                  style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "Tondo-light",)),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
