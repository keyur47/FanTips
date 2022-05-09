import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';


class CompletedScorecard extends StatelessWidget {
  const CompletedScorecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                  child: Scorecard(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
