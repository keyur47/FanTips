import 'package:fantips/Screens/Experts/ExperInfo/expertmatches/ExpertMatches.dart';
import 'package:fantips/Screens/Experts/ExperInfo/info/info.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../controller/ExpertsController.dart';

class ExpertInfo extends StatefulWidget {
   ExpertInfo(    {required this.name,
     required this.pre,
     required this.sub,
     required this.wins,
     required this.backgroundImage,
     required this.ave});

   String? name;
   String? ave;
   String? pre;
   String? wins;
   String? sub;
   String? backgroundImage;

  @override
  State<ExpertInfo> createState() => _ExpertInfoState();
}

class _ExpertInfoState extends State<ExpertInfo> {
  ExpertsController expertsController = Get.put(ExpertsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Container(padding:EdgeInsets.only(right: 30.w),child: const Text("Live Support")),
          bottom:  TabBar(
            padding: EdgeInsets.only(right: 50.w),
            isScrollable: true,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            indicatorColor: AppColor.green,
            labelColor: AppColor.green,
            labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            unselectedLabelColor: AppColor.white,
            indicatorSize: TabBarIndicatorSize.label,
            overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.transparent;
              } if (states.contains(MaterialState.focused)) {
                return Colors.orange;
              } else if (states.contains(MaterialState.hovered)) {
                return Colors.pinkAccent;
              }

              return Colors.transparent;
            }),
            tabs: const [
              Tab(text: AppString.info),
              Tab(text: AppString.matches)
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Info(name: widget.name, sub: widget.sub, ave: widget.ave, wins: widget.wins, backgroundImage: widget.backgroundImage, pre: widget.pre,),
            ExpertMatches()
          ],
        ),
      ),
    );
  }
}
