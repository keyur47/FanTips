import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {

  void share() {
    FlutterShare.share(title: "Example", linkUrl: "'https://flutter.dev/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            color: Colors.lightGreenAccent[700],
          ),
          Padding(
            padding: EdgeInsets.only(left: 7.w, top: 15.w, right: 7.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "T1",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  "FanTips",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[100]),
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onTap: () {
                    share();
                  },
                )
              ],
            ),
          ),
          Row(
            children: [
              Lit(),
              Lit(),
              Lit(),
              Lit(),
              Lit(),
              Lit(),
              Lit(),
            ],
          ),
          Column(
            children: [
              Lit1(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
            child: Column(
              children: [
                const Text(
                  "WICKET-KEEPER",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppSizebox.h5,
                Lit2(),
                AppSizebox.h50,
                const Text(
                  "BATSMEN",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                AppSizebox.h5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Lit2(), Lit2(), Lit2()],
                ),
                AppSizebox.h50,
                const Text(
                  "ALL-ROUNDERS",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                AppSizebox.h5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Lit2(), Lit2(), Lit2()],
                ),
                AppSizebox.h45,
                const Text(
                  "BOWLERS",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                AppSizebox.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Lit2(),
                    Lit2(),
                    Lit2(),
                    Lit2(),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90.h),
            child: Container(
                height: 10.h,
                width: 100.w,
                color: Colors.black,
                child: Row(children: [
                  Lit3("TOTAL POINTS"),
                  AppSizebox.w15,
                  Lit3("RANK"),
                  AppSizebox.w25,
                  AppSizebox.w25,
                  AppSizebox.w25,
                  AppSizebox.w25,
                  AppSizebox.w25,
                  GestureDetector(child: Icon(Icons.clear,color: Colors.white,),onTap: (){Get.back();},)
                ],),),
          )
        ],
      ),
    );
  }

  Widget Lit() {
    return Padding(
      padding: EdgeInsets.only(left: 6.3.w),
      child: Container(
        height: 90.h,
        width: 7.w,
        color: Colors.black12,
      ),
    );
  }

  Widget Lit1() {
    return Padding(
      padding: EdgeInsets.only(left: 39.7.w, top: 32.3.h),
      child: Container(
        height: 32.h,
        width: 20.w,
        color: Colors.black26,
      ),
    );
  }

  Widget Lit2() {
    return Column(
      children: [
        Container(
          height: 5.h,
          width: 10.w,
          child: Image.asset(
            "asset/Images/team.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: const Text(
            "H.PANDYA",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          width: 18.w,
        ),
        AppSizebox.h5,
        const Text(
          "0.0 Pts",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Widget Lit3(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w,top: 2.h),
      child: Column(
        children: [
          const Text("10",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w800),),
          Text(text,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
