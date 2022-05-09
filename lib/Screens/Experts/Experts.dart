import 'dart:developer';

import 'package:fantips/Screens/Experts/ExperInfo/Expertinfo.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppIcon.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyAppbar.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

import 'controller/ExpertsController.dart';

class Experts extends StatefulWidget {
  const Experts({Key? key}) : super(key: key);

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  ExpertsController expertsController = Get.put(ExpertsController());

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[800],
              // title:  Text('Are you sure?'),
              content: const Text(
                'Are you sure want to exit?',
                style: TextStyle(color: Colors.white),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child:
                      const Text('NO', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child:
                      const Text('YES', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 6.h),
              child: Column(
                children: [
                  MyAppBar1(text: AppString.predictionExperts, login: AppString.logIn, image: 'asset/icon/search.png',),
                  Padding(
                    padding: EdgeInsets.only(top: 3.h),
                    child: InkWell(
                      child: Container(
                        height: 6.h,
                        width: 92.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.light),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppIcon.sortby,
                              height: 1.8.h,
                              color: AppColor.green,
                            ),
                            AppSizebox.w5,
                            const Text(AppString.sortBy + ":",
                                style:
                                    TextStyle(color: AppColor.green, fontSize: 16)),
                            AppSizebox.w5,
                            const Text(AppString.avgScore,
                                style:
                                    TextStyle(color: AppColor.green, fontSize: 16)),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColor.green,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.sp),
                              topRight: Radius.circular(12.sp),
                            ),
                          ),
                          context: context,
                          backgroundColor: (AppColor.light),
                          builder: (context) {
                            return Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: AppColor.light,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.sp),
                                  topRight: Radius.circular(12.sp),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 12.sp, right: 12.sp, top: 10.sp),
                                child: Obx(
                                  () {
                                    print(expertsController
                                        .getExpert.value.tipsters?.length);
                                    return Column(
                                      children: [
                                        AppSizebox.h5,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppIcon.sortby,
                                              color: Colors.white,
                                              height: 1.5.h,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            const Text(
                                              AppString.sortBy,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                        AppSizebox.h5,
                                        const Divider(
                                          color: AppColor.grey,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (expertsController.isBottomSelect =
                                                true) {
                                              expertsController.index.value = 0;
                                              print("prediction==>>>");
                                              expertsController
                                                  .getExpert.value.tipsters
                                                  ?.sort(
                                                (a, b) =>
                                                    a.totalPredictions!.compareTo(
                                                  b.totalPredictions!,
                                                ),
                                              );
                                              setState(() {});
                                            } else {
                                              expertsController.isBottomSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              const Text(
                                                AppString.prediction,
                                              ),
                                              const Spacer(),
                                              expertsController.index.value == 0
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor: AppColor.white,
                                                      child:
                                                          Icon(Icons.done, size: 12),
                                                    )
                                                  : const Text(
                                                      "",
                                                    )
                                            ],
                                          ),
                                        ),
                                        AppSizebox.h4,
                                        const Divider(
                                          color: AppColor.grey,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (expertsController.isBottomSelect =
                                                true) {
                                              expertsController.index.value = 1;
                                              print("avgScore==>>>");
                                              expertsController
                                                  .getExpert.value.tipsters
                                                  ?.sort((a, b) => a.avgScore!
                                                      .compareTo(b.avgScore!));
                                              setState(() {});
                                            } else {
                                              expertsController.isBottomSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              const Text(
                                                AppString.avgScore,
                                              ),
                                              Spacer(),
                                              expertsController.index.value == 1
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor: AppColor.white,
                                                      child: Icon(
                                                        Icons.done,
                                                        size: 12,
                                                      ),
                                                    )
                                                  : const Text(
                                                      "",
                                                    )
                                            ],
                                          ),
                                        ),
                                        AppSizebox.h4,
                                        const Divider(
                                          color: AppColor.grey,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (expertsController.isBottomSelect =
                                                true) {
                                              expertsController.index.value = 2;
                                              print("wins==>>>");
                                              expertsController
                                                  .getExpert.value.tipsters
                                                  ?.sort((a, b) =>
                                                      a.top3!.compareTo(b.top3!));
                                              setState(() {});
                                            } else {
                                              expertsController.isBottomSelect =
                                                  false;
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              const Text(
                                                AppString.wins,
                                              ),
                                              const Spacer(),
                                              expertsController.index.value == 2
                                                  ? const CircleAvatar(
                                                      radius: 8,
                                                      backgroundColor: AppColor.white,
                                                      child:
                                                          Icon(Icons.done, size: 12),
                                                    )
                                                  : const Text(""),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                            // Container(
                            //   height: 29.h,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(left: 3.w, right: 3.w),
                            //     child: Column(
                            //       children: [
                            //         AppSizebox.h15,
                            //         Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: [
                            //             Image.asset(
                            //               AppIcon.sortby,
                            //               height: 1.5.h,
                            //             ),
                            //             AppSizebox.w5,
                            //             const Text(
                            //               AppString.sortBy,
                            //               style: TextStyle(
                            //                   fontSize: 20,
                            //                   fontWeight: FontWeight.w500),
                            //             ),
                            //           ],
                            //         ),
                            //         AppSizebox.h10,
                            //         Divider(
                            //           height: 1,
                            //           color: Colors.grey.shade700,
                            //         ),
                            //         SizedBox(
                            //           height: 7.h,
                            //           child: ListTile(
                            //             onTap: () {},
                            //             title: const Text(
                            //               AppString.predictions,
                            //               style: TextStyle(color: AppColor.white),
                            //             ),
                            //             trailing: const Icon(
                            //               Icons.check_circle,
                            //               color: AppColor.white,
                            //             ),
                            //           ),
                            //         ),
                            //         Divider(
                            //           height: 1,
                            //           color: Colors.grey.shade700,
                            //         ),
                            //         SizedBox(
                            //           height: 7.h,
                            //           child: ListTile(
                            //             onTap: () {},
                            //             title: const Text(
                            //               AppString.avgScore,
                            //               style: TextStyle(color: AppColor.white),
                            //             ),
                            //             trailing: const Icon(Icons.check_circle,
                            //                 color: AppColor.white),
                            //           ),
                            //         ),
                            //         Divider(
                            //           height: 1,
                            //           color: Colors.grey.shade700,
                            //         ),
                            //         SizedBox(
                            //           height: 7.h,
                            //           child: ListTile(
                            //             onTap: () {},
                            //             title: const Text(
                            //               AppString.wins,
                            //               style: TextStyle(color: AppColor.white),
                            //             ),
                            //             trailing: const Icon(Icons.check_circle,
                            //                 color: AppColor.white),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // backgroundColor: AppColor.light,
                            // elevation: 0,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Obx(
                    () => expertsController.isLoading.value
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child:  Container(
                                height: 3.h,
                                width: 6.w,
                                child: const LoadingIndicator(
                                    indicatorType: Indicator. lineSpinFadeLoader,
                                    colors: [Colors.white],
                                    strokeWidth: 1,
                                    backgroundColor: Colors.black,
                                    pathBackgroundColor: Colors.black
                                ),
                              )
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: expertsController.getitem.length,
                            controller: expertsController.scrollController,
                            itemBuilder: (BuildContext context, index) {
                              log("Service111111-------${expertsController.getitem.length}");
                              final Experts =
                                  expertsController.getitem.value[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    ExpertInfo(
                                      name: Experts.name,
                                      wins: "${Experts.top3}",
                                      ave: "${Experts.avgScore}",
                                      sub:
                                          "${Experts.subscriberCount!.length >= 1 ? Experts.subscriberCount?.substring(0, 4) : Experts.subscriberCount}...",
                                      //sub: '${Experts.subscriberCount}',
                                      pre: '${Experts.totalPredictions}',
                                      backgroundImage: Experts.profileUrl,
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    // ignore: invalid_use_of_protected_member
                                    Obx(()=>MyContainer22(
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
                                    ),),
                                    AppSizebox.h10,
                                    // expertsController.getitem.value.length -
                                    //     1 ==
                                    //     index
                                    //     ? SizedBox(
                                    //   height: 15.0,
                                    //   width: 15.0,
                                    //   child: Transform.scale(
                                    //     scale: 2,
                                    //     child:
                                    //     const CircularProgressIndicator(
                                    //       strokeWidth: 1,
                                    //       color: Colors.green,
                                    //     ),
                                    //   ),
                                    // )
                                    //     : const SizedBox(),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
