import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BestPicks extends StatefulWidget {
  @override
  State<BestPicks> createState() => _BestPicksState();
}

class _BestPicksState extends State<BestPicks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppSizebox.h10,
            const FantasyUpcoming(),
            AppSizebox.h5,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                  child: BestPicksTile(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
