import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingo/Home/homeScreen.dart';
import 'package:codingo/LogIn%20Signup/signUpOtpDetail.dart';
import 'package:codingo/LogIn%20Signup/signup.dart';
import 'package:flutter/material.dart';

class logIn extends StatelessWidget {
  logIn({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LOG IN",
                    style: TextStyle(
                        fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
                  ),
                  Text(
                    "Enter your login details",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Tondo-light",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: mailController,
                      autocorrect: false,
                      enableSuggestions: false,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF262626),
                        hintText: "Enter your username or mobile no",
                        hintStyle: TextStyle(
                            fontFamily: "Tondo-light",
                            color: Colors.grey,
                            fontSize: 15),
                        focusColor: Color(0xffd00000),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 10, top: 20, bottom: 20),
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Tondo-Light",
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passController,
                      obscureText: true,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF262626),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontFamily: "Tondo-light",
                            color: Colors.grey,
                            fontSize: 15),
                        focusColor: Color(0xffd00000),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 10, top: 20, bottom: 20),
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Tondo-Light",
                      )
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Color(0xffd00000),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffd00000),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => homeScreen()));
                        },
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                            fontFamily: "Tondo",
                          ),
                        )),
                  ),
                  SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Want to be a ",
                        style: TextStyle(
                          //fontSize: 18,
                          decoration: TextDecoration.none,
                          color: Color(0xffd00000),
                        ),
                      ),
                      Text(
                        " Guest ?",
                        style: TextStyle(
                          //fontSize: 18,
                          decoration: TextDecoration.none,
                          color: Color(0xffffffff),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => {
                  FocusScope.of(context).unfocus(),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => signUpDetails()//signup()
                      ))
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T HAVE ACCOUNT ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffd00000),
                      ),
                    ),
                    Text(
                      " SIGN UP",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}