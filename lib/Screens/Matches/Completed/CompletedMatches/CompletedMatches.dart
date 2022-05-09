import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';

import 'CompletedCommentary/CompletedCommentary.dart';
import 'CompletedFantasy/CompletedFantasy.dart';
import 'CompletedScorecard/CompletedScorecard.dart';
import 'CompletedSquad/CompletedSquad.dart';

class CompletedMatches extends StatelessWidget {
  const CompletedMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(padding: EdgeInsets.only(left: 2.w), child: const Text(AppString.pbksvsrcd)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                child: const Icon(Icons.search),
                onTap: () {
                  Get.toNamed('search');
                },
              ),
            )
          ],
          bottom: TabBar(
            padding: EdgeInsets.zero,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            indicatorColor: AppColor.green,
            labelColor: AppColor.green,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            tabs: [
              Tab(
                text: AppString.fantasy,
              ),
              Tab(text: AppString.commentary),
              Tab(text: AppString.scorecard),
              Tab(text: AppString.squads),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CompletedFantasy(),
            CompletedCommentary(),
            CompletedScorecard(),
            CompletedSquad(),
          ],
        ),
      ),
    );
  }
}
