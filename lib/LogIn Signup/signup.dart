import 'package:codingo/LogIn%20Signup/signUpOtpDetail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signup extends StatelessWidget {
  signup({Key? key}) : super(key: key);

  TextEditingController numberController = TextEditingController();

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
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
                  ),
                  Text(
                    "Enter your mobile no",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Tondo-light",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          maxLength: 5,
                          enabled: false,
                          autocorrect: false,
                          enableSuggestions: false,
                          cursorColor: Colors.white,
                          style: new TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Tondo-Light",
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xFF262626),
                            hintText: "+91",
                            hintStyle: TextStyle(
                                fontFamily: "Tondo-light",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            focusColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        flex: 5,
                        child: TextFormField(
                          controller: numberController,
                          maxLength: 10,
                          autocorrect: false,
                          enableSuggestions: false,
                          style: new TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Tondo-Light",
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xFF262626),
                            hintText: "Enter your mobile no",
                            hintStyle: TextStyle(
                                fontFamily: "Tondo-light",
                                color: Colors.grey,
                                fontSize: 15),
                            focusColor: Colors.white,
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
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffd00000),
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          numberController.text.length == 10
                              ? Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          signUpOtp(
                                              number: numberController.text)))
                              : Fluttertoast.showToast(
                              msg: "Enter valid number",  // message
                              toastLength: Toast.LENGTH_LONG              // duration
                          );
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            fontFamily: "Tondo",
                          ),
                        )),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ALREADY HAVE AN ACCOUNT ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffd00000),
                          ),
                        ),
                        Text(
                          " LOG IN",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
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
