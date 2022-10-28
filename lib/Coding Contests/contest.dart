import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

dynamic contestsList;
int contestsListLength = 0;
bool contextSelected = true;
List<String>? items = [];

class contest extends StatefulWidget {
  const contest({Key? key}) : super(key: key);

  @override
  State<contest> createState() => _contestState();
}

class _contestState extends State<contest> {

  @override
  void initState() {
    getApidata();
    super.initState();
  }

  getApidata() async {
    await http.get(Uri.parse("https://kontests.net/api/v1/all")).then((value) {
      var result = jsonDecode(value.body.toString());
      setState(() {
        contestsList = result;
        contestsListLength = result.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Contests",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontFamily: "Tondo")),
        backgroundColor: Colors.white12,
      ),
      body: contestsListLength == 0
          ? ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: kGradientBoxDecoration,
                    height: MediaQuery.of(context).size.height / 4 -
                        MediaQuery.of(context).size.height * 0.055,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Container(
                        decoration: kInnerDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ShimmerContainer(height: 20, width: 150),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: ShimmerContainer(
                                  height: 25,
                                  width: MediaQuery.of(context).size.width),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child:
                                      ShimmerContainer(height: 20, width: 150),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child:
                                      ShimmerContainer(height: 20, width: 150),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10),
                              child: ShimmerContainer(
                                  height: 35,
                                  width: MediaQuery.of(context).size.width *
                                      0.8 ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
          : RefreshIndicator(
              onRefresh: () => getApidata(),
              color: Color(0xffd00000),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() {
                            contextSelected = true;
                          }),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: 60,
                              decoration: kGradientBoxDecoration,
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  decoration: kInnerDecoration,
                                  child: Center(
                                    child: Text(
                                      "Upcoming",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: contextSelected
                                              ? Color(0xffF4B400)
                                              : Colors.white,
                                          fontFamily: "Tondo"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            contextSelected = false;
                          }),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 20,
                              height: 60,
                              decoration: kGradientBoxDecoration,
                              child: Padding(
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  decoration: kInnerDecoration,
                                  child: Center(
                                    child: Text("On Going",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: contextSelected
                                                ? Colors.white
                                                : Color(0xffF4B400),
                                            fontFamily: "Tondo")),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      itemCount: contestsListLength,
                      itemBuilder: (context, index) => contextSelected
                          ? contestsList[index]["status"] == "BEFORE"
                              ? ContestDataCard(index)
                              : SizedBox(
                                  width: 0,
                                  height: 0,
                                )
                          : contestsList[index]["status"] == "CODING"
                              ? ContestDataCard(index)
                              : SizedBox(width: 0, height: 0),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  final kInnerDecoration = BoxDecoration(
    color: Color(0xFF262626),
    borderRadius: BorderRadius.circular(20),
  );

  final kGradientBoxDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xffF4B400), Color(0xffd00000)]),
    borderRadius: BorderRadius.circular(20),
  );

  List months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  Padding ContestDataCard(int index) {
    double duration = double.parse(contestsList[index]["duration"]) / 60;
    DateTime Starttime =
        DateTime.parse(contestsList[index]["start_time"].substring(0, 19));
    DateTime Endtime =
        DateTime.parse(contestsList[index]["end_time"].substring(0, 19));
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      child: Container(
        decoration: kGradientBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(contestsList[index]["site"],
                      style: TextStyle(
                          fontFamily: "Tondo-light",
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          height: 0.1,
                          fontSize: MediaQuery.of(context).size.width * 0.04)),
                  Divider(
                    color: Colors.white24,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(contestsList[index]["name"],
                        style: TextStyle(
                            overflow: TextOverflow.visible,
                            fontFamily: "Tondo-light",
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.04)),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Starts On ",
                                  style: TextStyle(
                                      fontFamily: "Tondo-light",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)
                              ),
                              Text("Time ",
                                  style: TextStyle(
                                      fontFamily: "Tondo-light",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(": ${Starttime.day.toString()} ${months[Starttime.month.toInt() - 1]} ${Starttime.year.toString()}",
                                  style: TextStyle(
                                      fontFamily: "Tondo-light",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)
                              ),
                              Text(": ${Starttime.hour.toString()}:${Starttime.minute.toString()} Hours",
                                  style: TextStyle(
                                      fontFamily: "Tondo-light",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Duration : ",
                                style: TextStyle(
                                    fontFamily: "Tondo-light",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                            TextSpan(
                                text: Endtime.difference(Starttime).inHours < 24
                                    ? "${Endtime.difference(Starttime).inHours} Hours"
                                    : "${Endtime.difference(Starttime).inDays} Days",
                                style: TextStyle(
                                    fontFamily: "Tondo-light",
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white24,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launch(contestsList[index]['url']);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.computer_sharp),
                                Text(
                                  "  Participate",
                                  style: TextStyle(
                                    fontFamily: "Tondo",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Share.share("Participate in ${contestsList[index]['site']} contest of ${Endtime.difference(Starttime).inHours < 24
                              ? "${Endtime.difference(Starttime).inHours} Hours"
                              : "${Endtime.difference(Starttime).inDays} Days"} on ${Starttime.day.toString()} ${months[Starttime.month.toInt() - 1]} ${Starttime.year.toString()} at ${Starttime.hour.toString()}:${Starttime.minute.toString()} \n\n${contestsList[index]['url']}");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Share  ",
                                  style: TextStyle(
                                    fontFamily: "Tondo",
                                  ),
                                ),
                                Icon(Icons.share_rounded),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            decoration: kInnerDecoration,
          ),
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  double height;
  double width;

  ShimmerContainer({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade600,
      highlightColor: Colors.grey.shade700,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(7)),
        height: this.height,
        width: this.width,
      ),
    );
  }
}
