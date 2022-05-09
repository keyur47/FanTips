import 'package:fantips/Screens/IPL/Squads/Squads.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'BestPicks/BestPicks.dart';
import 'Fantasy/Fantasy.dart';
import 'MyTeams/MyTeams.dart';

class UpcomingMatches extends StatelessWidget {
  const UpcomingMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(padding: EdgeInsets.only(left: 2.w), child: const Text(AppString.gtvslsg)),
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
          bottom:  TabBar(
            splashFactory: NoSplash.splashFactory,

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
              Tab(text: AppString.bestPicks),
              Tab(text: AppString.myTeams),
              Tab(text: AppString.squads)
            ],
          ),
        ),
        body: TabBarView(
          children: [Fantasy(), BestPicks(), MyTeams(), Squads()],
        ),
      ),
    );
  }
}
