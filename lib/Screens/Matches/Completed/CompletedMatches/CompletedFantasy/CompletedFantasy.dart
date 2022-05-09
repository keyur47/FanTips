import 'dart:developer';

import 'package:fantips/Screens/Experts/ExperInfo/Expertinfo.dart';
import 'package:fantips/Screens/Experts/controller/ExpertsController.dart';
import 'package:fantips/Screens/Matches/U%20L%20C%20Matches/Team/team.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sizer/sizer.dart';


class CompletedFantasy extends StatefulWidget {
  const CompletedFantasy({Key? key}) : super(key: key);

  @override
  State<CompletedFantasy> createState() => _CompletedFantasyState();
}

class _CompletedFantasyState extends State<CompletedFantasy> {
  ExpertsController expertsController = Get.put(ExpertsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: const FantasyCompleted(),
          ),
          AppSizebox.h5,
          Padding(
            padding: EdgeInsets.only(top: 13.h),
            child: SingleChildScrollView(
              child: Obx(
                () => expertsController.isLoading.value
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: const CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ))
                    : Padding(
                        padding: EdgeInsets.only(top: 0.h),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: expertsController.getitem.length,
                          controller: expertsController.scrollController,
                          itemBuilder: (BuildContext context, index) {
                            log("Service111111-------${expertsController.getitem.length}");
                            final Experts =
                                expertsController.getitem.value[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(Team());

                                    // Get.to(
                                    //   ExpertInfo(
                                    //     name: Experts.name,
                                    //     wins: "${Experts.top3}",
                                    //     ave: "${Experts.avgScore}",
                                    //     sub:
                                    //         "${Experts.subscriberCount!.length >= 1 ? Experts.subscriberCount?.substring(0, 4) : Experts.subscriberCount}...",
                                    //     //sub: '${Experts.subscriberCount}',
                                    //     pre: '${Experts.totalPredictions}',
                                    //     backgroundImage: Experts.profileUrl,
                                    //   ),
                                    // );
                                  },
                                  child: Obx(()=>MyContainer22(
                                    headerText:
                                    "${Experts.name!.length >= 25 ? Experts.name?.substring(0, 12) : Experts.name}",
                                    pr: "${Experts.totalPredictions ?? " "}",
                                    ave: "${Experts.avgScore ?? ""}",
                                    wins: "${Experts.top3}",
                                    subscribers: '${Experts.subscriberCount}',
                                    backgroundImage: Experts.profileUrl ?? "",
                                    onTap: () {
                                      if (Experts.inWishList?.value ==
                                          false) {
                                        expertsController
                                            .addItem(Experts.name ?? "");
                                      } else {
                                        expertsController
                                            .removeItem(Experts.name ?? "");
                                      }
                                    },
                                    iconButton: expertsController.getitem
                                        .value[index].inWishList == true
                                        ? Icon(Icons.favorite,color: Colors.green,)
                                        : Icon(Icons.favorite_border,color: Colors.green,),
                                  ),)
                                ),
                                AppSizebox.h10,
                              ],
                            );
                          },
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
