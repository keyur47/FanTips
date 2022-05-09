import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class CompletedCommentary extends StatelessWidget {
  const CompletedCommentary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                AppSizebox.h10,
                const FantasyCompleted(),
                AppSizebox.h5,

                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
                        child: Commentary(),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
