import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codingo/Home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signUpOtp extends StatelessWidget {
  String? number;
  signUpOtp({Key? key,this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OTP",
                style: TextStyle(
                    fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "OTP sent to your no ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Tondo-light",
                    ),
                  ),
                  Text(
                    "${this.number}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffd00000),
                      fontFamily: "Tondo-light",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                fieldWidth: MediaQuery.of(context).size.width / 4 - 40,
                cursorColor: Colors.white,
                autoFocus: true,
                keyboardType: TextInputType.number,
                fillColor: Color(0xFF262626),
                filled: true,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                focusedBorderColor: Colors.white,
                numberOfFields: 4,
                borderColor: Color(0xFFFFFFFF),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                onSubmit: (String verificationCode){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
              SizedBox(
                height: 30,
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => signUpDetails()));
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
        ),
      ),
    );
  }
}


List usernameList = [];
final validCharacters = RegExp(r'^[a-z0-9_.!]+$');
class signUpDetails extends StatefulWidget {
  signUpDetails({Key? key}) : super(key: key);

  @override
  State<signUpDetails> createState() => _signUpDetailsState();
}

class _signUpDetailsState extends State<signUpDetails> {

  final formkey = GlobalKey<FormState>();
  final Usernamekey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  Future firebaseGetData() async {
    DocumentSnapshot ds =
    await _firestore.collection("usernameList").doc("usernameList").get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    usernameList = data["usernameList"];
  }

  @override
  void initState() {
    firebaseGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SETUP YOUR PROFILE",
                      style: TextStyle(
                          fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
                    ),
                    Text(
                      "Enter your details",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "Tondo-light",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*CircleAvatar(
                        backgroundColor: Color(0xFF262626),
                        radius: 50,
                        backgroundImage: AssetImage(
                            "assets/Images/CodinGo Logo.png"
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),*/
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Enter your Name",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Tondo-light",
                          ),
                        ),
                      ),
                      TextFormField(
                          validator: (value){
                            if( value!.isEmpty)
                              return "Enter your name";
                            else
                              return null;
                          },
                          controller: nameController,
                          autocorrect: false,
                          enableSuggestions: false,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Color(0xFF262626),
                            hintText: "Name",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Enter your Username",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Tondo-light",
                          ),
                        ),
                      ),
                      Form(
                        key: Usernamekey,
                        child: TextFormField(
                            validator: (value){
                              if( usernameList.contains(value) )
                                return "Username unavailable";
                              else if( !validCharacters.hasMatch(value.toString()) && value!.length > 0 )
                                return "Username can only contain lowercase, '.', '_' & '!'";
                              else
                                return null;
                            },
                            onChanged: (value){
                              final isValid = Usernamekey.currentState!.validate();
                            },
                            controller: usernameController,
                            autocorrect: false,
                            enableSuggestions: false,
                            cursorColor: Colors.white,
                            maxLength: 30,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(color: Colors.white),
                              fillColor: Color(0xFF262626),
                              hintText: "Username",
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Enter your Email Id",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Tondo-light",
                          ),
                        ),
                      ),
                      TextFormField(
                          validator: (value){
                            if( !value!.contains("@") && value.length > 15 )
                              return "Enter valid mail id";
                            else if(value.isEmpty)
                              return "Enter your Email Id";
                            else
                              return null;
                          },
                          controller: mailController,
                          autocorrect: false,
                          enableSuggestions: false,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Color(0xFF262626),
                            hintText: "Email Id",
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
                          keyboardType: TextInputType.emailAddress,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Enter your Password",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Tondo-light",
                          ),
                        ),
                      ),
                      TextFormField(
                          validator: (value){
                            if( value!.length < 8)
                              return "Atleast 8 characters required";
                            else
                              return null;
                          },
                          /*onChanged: (value){
                            //final isValid = formkey.currentState!.validate();
                          },*/
                          controller: passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
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
                      SizedBox(
                          height: 10),
                      TextFormField(
                        validator: (value){
                          if( value != passwordController.text && value!.length > 2)
                            return "Passwords do not match!";
                          else if( value!.length < 8)
                            return "Atleast 8 characters required";
                          else
                            return null;
                        },
                        onChanged: (value){
                          final isValid = formkey.currentState!.validate();
                        },
                        controller: repasswordController,
                        obscureText: true,
                        obscuringCharacter: '*',
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF262626),
                          hintText: "Retype Password",
                          hintStyle: TextStyle(
                              fontFamily: "Tondo-light",
                              color: Colors.grey,
                              fontSize: 15),
                          focusColor: Color(0xffd00000),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),),
                          contentPadding: EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 20),
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
                          height: 40),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffd00000),
                            ),
                            onPressed: () {
                              if(formkey.currentState!.validate()) {
                                if(usernameController.text.isEmpty)
                                  Fluttertoast.showToast(
                                      toastLength: Toast.LENGTH_LONG,
                                      msg: "Enter Username!"
                                  );
                                else
                                  Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) => homeScreen()));
                              }
                            },
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                fontFamily: "Tondo",
                              ),
                            )),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: ()=> Navigator.pop(context),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
