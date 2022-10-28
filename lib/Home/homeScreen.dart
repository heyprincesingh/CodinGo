import 'package:codingo/Coding%20Contests/contest.dart';
import 'package:codingo/Notification/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "COTD CodinGo.png",
  "Resume CodinGo.png",
];
int sliderCardIndex = 0;

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
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
                    );
                  }).toList(),
                ),
                Divider(
                  height: 25,
                  color: Colors.white70,
                  thickness: 1,
                  endIndent: 15,
                  indent: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  "assets/Images/Learn logo CodinGo.png")),
                          color: Colors.white10,
                          border: Border.all(
                              color: Colors.white70 /*Color(0xff1AC70B)*/,
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  "assets/Images/DSA logo CodinGo.png")),
                          border: Border.all(
                              color: Colors.white70 /*Color(0xffd00000)*/,
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => contest()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.width / 2.2,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    "assets/Images/Coding Contest logo CodinGo.png")),
                            border: Border.all(
                                color: Colors.white70 /*Color(0xffF4B400)*/,
                                width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 2.2,
                      width: MediaQuery.of(context).size.width / 2.2,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  "assets/Images/Calander logo CodinGo.png")),
                          border: Border.all(
                              color: Colors.white70 /*Color(0xff4285F4)*/,
                              width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ],
                ),
                Divider(
                  height: 25,
                  color: Colors.white70,
                  thickness: 1,
                  endIndent: 15,
                  indent: 15,
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/Images/ytwall.jpg")),
                      color: Colors.white10,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(height: 10),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/Images/interview.jpg")),
                      color: Colors.white10,
                      border: Border.all(color: Color(0xff4285F4), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
