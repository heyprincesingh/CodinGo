import 'dart:convert';
import 'package:codingo/Coding%20Contests/contest.dart';
import 'package:codingo/Notification/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

final List<String> imgList = [
  "COTD CodinGo.png",
  "Resume CodinGo.png",
];

String quote = "There are 10 types of people in this world. Those who know Binary and those who don't!";
String author = "CodinGo";

final List<String> forYou = [
  "c++.png",
  "Java.png",
  "python.png",
  "js.png",
  "css.png"
];
int sliderCardIndex = 0;

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    getApiQuote();
  }

  getApiQuote() async {
    print("Running API");
    await http
        .get(Uri.parse(
            "https://programming-quotes-api.herokuapp.com/Quotes?count=1"))
        .then((value) {
      var Newquote = jsonDecode(value.body.toString());
      print(Newquote);
      setState(() {
        quote = Newquote[0]["en"];
        author = Newquote[0]["author"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
        titleTextStyle: TextStyle(letterSpacing: 1),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Codin",
              style: TextStyle(
                  fontSize: 24, color: Colors.white, fontFamily: "Tondo"),
            ),
            SizedBox(width: 2),
            Text(
              "Go",
              style: TextStyle(
                  fontSize: 24, color: Color(0xffd00000), fontFamily: "Tondo"),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => notification()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Stack(
                children: [
                  Center(
                      child: Icon(
                    //Icons.notifications_active,
                    Icons.notifications,
                    size: 26,
                    color: Colors.white,
                  )),
                  Positioned(
                    left: 0,
                    top: 10,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Color(0xffd00000),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              CupertinoIcons.profile_circled,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      onPageChanged: (a, b) {
                        sliderCardIndex = a;
                      },
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 0.97,
                      height: 200),
                  items: imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                border: Border.all(
                                    color: i == "COTD CodinGo.png"
                                        ? Color(0xffd00000)
                                        : Colors.white70,
                                    width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: i == "COTD CodinGo.png"
                                ? Image.asset(
                                    "assets/Images/COTD CodinGo.png",
                                    fit: BoxFit.fitWidth,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("QUOTE OF THE DAY",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: "Tondo"
                                            )
                                        ),
                                        SizedBox(height: 15),
                                        Text('"${quote}"',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffff0000),
                                                fontSize: 14,
                                                height: 1.5,
                                                fontFamily: "Poppins"
                                            )
                                        ),
                                        Text(author,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontFamily: "Tondo"
                                            ))
                                      ],
                                    )
                            ),
                          ),
                        );
                      },
                    ); /*Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage("assets/Images/$i")),
                                border: Border.all(
                                    color: i == "COTD CodinGo.png"
                                        ? Color(0xffd00000)
                                        : Color(0xff4285F4),
                                    width: 2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                          ),
                        );
                      },
                    );*/
                  }).toList(),
                ),
                SizedBox(height: 20),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("For You",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Poppins")),
                    Divider(
                        thickness: 1,
                        color: Colors.white,
                        endIndent: MediaQuery.of(context).size.width * 0.6),
                    SizedBox(height: 5),
                    Container(
                      height: MediaQuery.of(context).size.width / 1.8,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    color: Colors.white10,
                                    border: Border.all(
                                        color: Colors.white70, width: 2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/forYou/${forYou[index]}",
                                      fit: BoxFit.fitWidth,
                                    ),
                                    index == 0
                                        ? Positioned(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.3,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  9,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(18),
                                                    bottomRight:
                                                        Radius.circular(18),
                                                  ),
                                                  gradient: LinearGradient(
                                                    stops: [0.45, 1.0],
                                                    colors: [
                                                      Color(0xffd00000),
                                                      Colors.transparent,
                                                    ],
                                                  )),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8),
                                                    child: Icon(
                                                        Icons
                                                            .play_circle_rounded,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    "Resume",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            bottom: 0,
                                            left: 0,
                                          )
                                        : SizedBox(
                                            width: 0,
                                            height: 0,
                                          )
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Features",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Poppins")),
                    Divider(
                        thickness: 1,
                        color: Colors.white,
                        endIndent: MediaQuery.of(context).size.width * 0.6),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width / 2.15,
                          width: MediaQuery.of(context).size.width / 2.15,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      "assets/Images/Learn logo CodinGo.png")),
                              color: Colors.white10,
                              border: Border.all(
                                  color: Colors.white70 /*Color(0xff1AC70B)*/,
                                  width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 2.15,
                          width: MediaQuery.of(context).size.width / 2.15,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      "assets/Images/DSA logo CodinGo.png")),
                              border: Border.all(
                                  color: Colors.white70 /*Color(0xffd00000)*/,
                                  width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        contest()));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.width / 2.15,
                            width: MediaQuery.of(context).size.width / 2.15,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                        "assets/Images/Coding Contest logo CodinGo.png")),
                                border: Border.all(
                                    color:
                                        Colors.white70 /*Color(0xffF4B400)*/,
                                    width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width / 2.15,
                          width: MediaQuery.of(context).size.width / 2.15,
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      "assets/Images/Calander logo CodinGo.png")),
                              border: Border.all(
                                  color: Colors.white70 /*Color(0xff4285F4)*/,
                                  width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}