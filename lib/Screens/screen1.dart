import 'package:fantips/Screens/screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:sizer/sizer.dart';

import 'Home/Home.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
       const Duration(seconds: 2),
      () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:  Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                        //border: Border.all(width: 2,color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.8.w, top: 0.4.h),
                      child: Container(
                        height: 114,
                        width: 114,
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage("asset/Images/fantips_logo.png")
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Text(
                  "FANTIPS",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 38, shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(5, 7),
                      blurRadius: 15,
                    )
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: FadingText(
                  '...',
                  style: TextStyle(color: Colors.black, fontSize: 80),
                ),
              ),
              // SizedBox(height: 2.0),
            ],
          ),
        ),
      ),
    );
  }
}
