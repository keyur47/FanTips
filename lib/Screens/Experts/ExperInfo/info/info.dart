import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Util/AppIcon.dart';
import '../../../../Util/Sizebox.dart';

class Info extends StatefulWidget {
  Info(
      {required this.name,
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
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  void share() {
    FlutterShare.share(title: "Example", linkUrl: "https://play.google.com/store/apps/details?id=fantasy.prediction.fantips");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: share,
                  child: const Icon(
                    Icons.share,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),
          ClipOval(
            child: Image.network(widget.backgroundImage??"",
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          AppSizebox.h20,
          Text(
            widget.name ?? "",
            // "DEV's fantasy XI",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          AppSizebox.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcon.uTube, height: 2.h),
              AppSizebox.w5,
              const Text(
                AppString.utube,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          AppSizebox.h20,
          Container(
            height: 3.h,
            width: 25.w,
            color: AppColor.light,
            child: Center(
                child: InkWell(
                    onTap: () {
                      launch("https://www.youtube.com");
                    },
                    child: const Text(
                      AppString.viewChannel,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ))),
          ),
          AppSizebox.h20,
          Container(
              height: 36.h,
              width: 86.w,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 32.w),
                      child: const VerticalDivider(
                        color: AppColor.DividerColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 14.h),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      left: 5.w,
                      child: Column(
                        children:  [
                          Text(
                            widget.pre??"",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),
                          ),
                          Text(
                            AppString.prediction,
                            style: TextStyle(fontSize: 14,color: AppColor.greymin,fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      left: 44.w,
                      child: Column(
                        children:  [
                          Text(
                            widget.ave??"",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),
                          ),
                          Text(
                            AppString.avgS,
                            style: TextStyle(fontSize: 14,color: AppColor.greymin,fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),

                    Positioned(
                      top: 17.h,
                      left: 8.w,
                      child: Column(
                        children:  [
                          Text(
                        widget.wins??"",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),
                          ),
                          Text(
                            AppString.wins,
                            style: TextStyle(fontSize: 14,color: AppColor.greymin,fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 17.h,
                      left: 44.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.sub??"",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),
                          ),
                          const Text(
                            AppString.subscriber,
                            style: TextStyle(fontSize: 14,color: AppColor.greymin,fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),

                    // Positioned(
                    //   top: 13.h,
                    //   child: SizedBox(
                    //     width: 54.w,
                    //     child: Padding(
                    //       padding:  EdgeInsets.only(left: 2.w,right: 2.w),
                    //       // child: Row(
                    //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       //   children: [
                    //       //   Column(children: const [
                    //       //     Text("444",style: TextStyle(fontSize: 30),),
                    //       //     Text("fgfg",style: TextStyle(fontSize: 15),)
                    //       //   ],),
                    //       //     // Container(width: 1,height: 11.4.h, color:AppColor.DividerColor),
                    //       //   Column(children: const [
                    //       //     Text("444",style: TextStyle(fontSize: 30),),
                    //       //     Text("fgfg",style: TextStyle(fontSize: 15),)
                    //       //   ],),
                    //       // ],),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
