import 'package:covid19/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Image.asset(
                "assets/images/start.png",

                width: double.infinity,
                height: MediaQuery.of(context).size.height*.65,
                fit: BoxFit.cover,
              ),
              Container(
                clipBehavior: Clip.none,
                width: double.infinity,
                height: MediaQuery.of(context).size.height*.35,

padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),

                decoration: BoxDecoration(
                 color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(100)),
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Be aware\nStay healthy",
                      style: GoogleFonts.questrial(
                          color: Color(0xff142237),
                          fontWeight: FontWeight.w400,
                          fontSize: 30),
                    ),
                    Text(
                      'Welcome to COVID-19 information portal.',
                      style: GoogleFonts.poppins(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),


                    GestureDetector(
                      onTap:(){

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: ((context) => Home ())), (route) => false);
                      } ,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'GET STARTED',
                            style: GoogleFonts.poppins(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(

                              decoration: BoxDecoration(
                                color: Color(0xff9156EC),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Icon(
                                  size: 30,
                                  color: Colors.white,
                                  Icons.arrow_forward_outlined))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
