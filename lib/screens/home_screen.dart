import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  bool loading = false;
  late List coutryList = [];

  @override
  void initState() {
    super.initState();
    getDatafromApi();
  }



  getDatafromApi() async {
    final responce = await http.get(
      Uri.parse('https://api.covid19api.com/summary'),
    );

    print(responce.statusCode);

    var body = jsonDecode(responce.body);
    print("hi");
    coutryList = body['Countries'];


    setState(() {
      loading = true;
      data = body;
      print(data["Global"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: loading == false
                ? CircularProgressIndicator()
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/User.png"),
                              minRadius: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xffCFE3FC)),
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    Stack(clipBehavior: Clip.none, children: [
                                  Positioned(
                                      top: -25,
                                      bottom: 0,
                                      right: 20,
                                      left: 0,
                                      child: Image.asset(
                                        "assets/images/doctor.png",
                                      )),
                                ]),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Know safety tips and precautions from top Doctors.",
                                      style: GoogleFonts.poppins(
                                          color: Color(0xff142237),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    Container(
                                        width: 41,
                                        height: 19,
                                        decoration: BoxDecoration(
                                          color: Color(0xff9156EC),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Icon(
                                            size: 20,
                                            color: Colors.white,
                                            Icons.arrow_forward_outlined),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 38,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xfff49e6f).withOpacity(0.5),
                                )
                              ],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                indicatorColor: Colors.black, tabs: [
                              Text(
                                "Tracker",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff142237),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Text(
                                "Symptoms",
                                style: GoogleFonts.poppins(
                                    color: Color(0xffa74813),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ])),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xfffc1441).withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Confirmed",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xfffc1441),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${data["Global"]['TotalConfirmed']}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xfffc1441),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff157ffb).withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Death",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff157ffb),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${data["Global"]['NewDeaths']}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff157ffb),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff30A64A).withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Latest",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff30A64A),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${data["Global"]['NewConfirmed']}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff30A64A),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                height: 110,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff6D757D).withOpacity(0.1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Death",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff6D757D),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${data["Global"]['TotalDeaths']}',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff6D757D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "All List",
                              style: GoogleFonts.poppins(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffcfe3fc).withOpacity(0.5),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Text(
                                "Date",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),

                              Text(
                                "Countries",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Text(
                                "Latest",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Text(
                                "Confirmed",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Text(
                                "NewDeath",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                              Text(
                                "TotalDeath",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: coutryList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  height: 20,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffcfe3fc)
                                              .withOpacity(0.5),
                                        )
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["Date"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["Country"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["NewConfirmed"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["TotalConfirmed"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["NewDeaths"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${coutryList[index]["TotalDeaths"].toString()}",
                                          style: GoogleFonts.poppins(
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
