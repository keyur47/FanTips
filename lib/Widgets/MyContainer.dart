import 'package:fantips/Helper/MyBottomsheet/MyBottomSheet.dart';
import 'package:fantips/Screens/Experts/controller/ExpertsController.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppIcon.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../Screens/Home/Home.dart';
import '../Screens/More/favoriteMore.dart';
import '../Screens/loginpage/GoogleLogin/getdata.dart';
import '../Screens/loginpage/GoogleLogin/profile.dart';
import '../Screens/loginpage/GoogleLogin/services.dart';

///First Container Home
class MyContainer1 extends StatefulWidget {
  MyContainer1({Key? key}) : super(key: key);

  @override
  State<MyContainer1> createState() => _MyContainer1State();
}

class _MyContainer1State extends State<MyContainer1> {
  bool _value = true;
  BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('upcomingmatches');
      },
      child: Container(
        height: 20.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(top: 1.h, left: 4.w, right: 4.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: const Text("Zimbabwe vs Afghanistan",
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ),
                  // Image.asset(AppIcon.notification, height: 2.2.h)
                  // Icon(Icons.notifications_none,color: Colors.white,)

                  InkWell(
                    onTap: () {
                      setState(() {
                        _value = !_value;
                      });
                    },
                    child: Container(
                        child: _value
                            ? Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              )
                            : Icon(Icons.notifications, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage('asset/Images/Zim.png')),
                          SizedBox(width: 2.w),
                          const Text("ZIM",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 16.w),
                          const Text(
                            "133/7",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 1.w),
                          const Text(
                            "&",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Text(
                            "133/7",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage('asset/Images/Afg.png')),
                          SizedBox(width: 2.w),
                          const Text(
                            "ZIM",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 16.w),
                          const Text(
                            "133/7",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 1.w),
                          const Text("&",
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          SizedBox(width: 1.w),
                          const Text(
                            "133/7",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      const Text(AppString.matchTime + ' 5:45s',
                          style: TextStyle(fontSize: 12))
                    ],
                  ),
                  SizedBox(
                      height: 9.h,
                      child: const VerticalDivider(
                          color: AppColor.DividerColor, thickness: 1)),
                  SizedBox(
                    width: 19.w,
                    child: Column(
                      children: const [
                        Text('72',
                            style: TextStyle(
                                height: 1.6,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: AppColor.green)),
                        Text('Prediction',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AppColor.green))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///Second Container T20Prediction
class MyContainer2 extends StatefulWidget {
  const MyContainer2(
      {Key? key,
      required this.backgroundImage,
      required this.name,
      required this.subscribers,
      required this.age,
      required this.wins,
      required this.pr})
      : super(key: key);
  final ImageProvider backgroundImage;
  final String name;
  final String subscribers;
  final String pr;
  final String age;
  final String wins;

  @override
  State<MyContainer2> createState() => _MyContainer2State();
}

class _MyContainer2State extends State<MyContainer2> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('expertinfo');
      },
      child: Container(
          height: 18.h,
          width: 92.w,
          decoration: BoxDecoration(
              color: AppColor.light, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Positioned(
                  top: 2.2.h,
                  left: 2.w,
                  child: SizedBox(
                    height: 5.h,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: widget.backgroundImage,
                          minRadius: 20,
                        ),
                        AppSizebox.w5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                Image.asset(AppIcon.uTube, height: 1.h),
                                AppSizebox.w2,
                                Text(
                                  widget.subscribers,
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Positioned(
                top: 2.h,
                left: 82.w,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Container(
                      child: _value
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.green,
                            )
                          : const Icon(Icons.favorite_border,
                              color: Colors.green)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 6.w),
                child: SizedBox(
                  height: 7.h,
                  // width: 85.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text(widget.pr,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: "GothamPro",
                                color: AppColor.greymin)),
                        const Text(
                          AppString.prediction,
                          style: TextStyle(
                            color: AppColor.greymin,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            // fontFamily: "GothamPro",
                          ),
                        )
                      ]),
                      const VerticalDivider(
                          width: 2,
                          color: AppColor.dBlack,
                          thickness: 1,
                          endIndent: 10,
                          indent: 10),
                      Column(children: [
                        Text(widget.age,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GothamPro",
                              color: AppColor.greymin,
                            )),
                        const Text(
                          AppString.avgScore,
                          style: TextStyle(
                            color: AppColor.greymin,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            // fontFamily: "GothamPro",
                          ),
                        )
                      ]),
                      const VerticalDivider(
                          width: 2,
                          color: AppColor.dBlack,
                          thickness: 1,
                          endIndent: 10,
                          indent: 10),
                      Column(children: [
                        Text(widget.wins,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GothamPro",
                              color: AppColor.greymin,
                            )),
                        const Text(
                          AppString.wins,
                          style: TextStyle(
                            color: AppColor.greymin,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            // fontFamily: "GothamPro",
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

///Third Container Home news
class MyContainer3 extends StatelessWidget {
  const MyContainer3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      child: Container(
          height: 38.h,
          width: 92.w,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Image.asset('asset/Images/Ground.png'),
              Container(
                height: 12.h,
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                        'BCCI Secretary Arun Dhumal loss to the tune to thge matches... ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    Text(
                        'India have registered their second successive Test series win in Australia, after beating...',
                        style: TextStyle(color: AppColor.grey, fontSize: 12)),
                    Text('20h ago',
                        style: TextStyle(color: AppColor.grey, fontSize: 12))
                  ],
                ),
              )
            ],
          )),
    );
  }
}

///Fourth Container Upcoming
class MyContainer4 extends StatefulWidget {
  const MyContainer4(
      {Key? key,
      required this.headerText,
      required this.backgroundImage1,
      required this.backgroundImage2,
      required this.matchesname1,
      required this.matchesname2,
      required this.infoMsg,
      required this.totalprediction,
      required this.Starts})
      : super(key: key);

  final String headerText;
  final String backgroundImage1;
  final String backgroundImage2;
  final String matchesname1;
  final String matchesname2;
  final String infoMsg;
  final String totalprediction;
  final String Starts;

  @override
  State<MyContainer4> createState() => _MyContainer4State();
}

class _MyContainer4State extends State<MyContainer4> {
  static String hourAndMin(int milliSecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecond);
    final dt =
        DateTime(date.year, date.month, date.day, date.hour, date.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('upcomingmatches');
      },
      child: Container(
        height: 20.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.headerText,
                          style: const TextStyle(
                              fontSize: 12, color: AppColor.greymin)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _value = !_value;
                          });
                        },
                        child: Container(
                            child: _value
                                ? const Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                  )
                                : const Icon(Icons.notifications,
                                    color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  // Container(
                                  //   height: 4.h,
                                  //   width: 8.5.w,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(50)),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(60),
                                  //     child: Image.network(
                                  //       widget.backgroundImage2,
                                  //       fit: BoxFit.cover,
                                  //       loadingBuilder:
                                  //           (context, child, loadingProgress) {
                                  //         if (loadingProgress == null)
                                  //           return child;
                                  //         return const Center(
                                  //             child: CircularProgressIndicator(
                                  //           color: Colors.green,
                                  //         ));
                                  //       },
                                  //       errorBuilder:
                                  //           (context, error, stackTrace) =>
                                  //               const Center(
                                  //         child: Text(
                                  //           "",
                                  //           style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 7),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  CircleAvatar(
                                    radius: 15, // Image radius
                                    backgroundImage: NetworkImage(
                                      widget.backgroundImage1,
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  CircleAvatar(
                                    radius: 15, // Image radius
                                    backgroundImage: NetworkImage(
                                      widget.backgroundImage2,
                                    ),
                                  ),
                                  // Container(
                                  //   height: 4.h,
                                  //   width: 8.5.w,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(50)),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(50),
                                  //     child: Image.network(
                                  //       widget.backgroundImage2,
                                  //       fit: BoxFit.cover,
                                  //       loadingBuilder:
                                  //           (context, child, loadingProgress) {
                                  //         if (loadingProgress == null)
                                  //           return child;
                                  //         return const Center(
                                  //             child:
                                  //                 CircularProgressIndicator());
                                  //       },
                                  //       errorBuilder:
                                  //           (context, error, stackTrace) =>
                                  //               const Center(
                                  //         child: Text(
                                  //           "",
                                  //           style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 7),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.matchesname1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                  SizedBox(height: 3.h),
                                  Text(widget.matchesname2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Match Starts in ${widget.infoMsg}",
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColor.greymin,
                        fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 62.w, top: 3.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 10.h,
                        child: const VerticalDivider(
                            color: AppColor.DividerColor, thickness: 1)),
                    AppSizebox.w2,
                    Padding(
                      padding: EdgeInsets.only(top: 2.5.h),
                      child: Column(
                        children: const [
                          Text("72",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.green)),
                          AppSizebox.h2,
                          Text("Predictions",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.green))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Fifth Container IPLMatches time
class MyContainer5 extends StatelessWidget {
  const MyContainer5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('upcomingmatches');
      },
      child: Container(
        height: 20.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 5.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Zimbabwe vs Afghanistan",
                      style: TextStyle(
                        fontSize: 12,
                      )),
                  Image.asset(AppIcon.notification, height: 2.2.h)
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage('asset/Images/Zim.png')),
                          SizedBox(width: 2.w),
                          const Text("ZIM",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(width: 40.w)
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage('asset/Images/Afg.png')),
                          SizedBox(width: 2.w),
                          const Text(
                            "ZIM",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 40.w)
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      const Text(AppString.matchTime + ' 5:45s',
                          style: TextStyle(fontSize: 12))
                    ],
                  ),
                  SizedBox(
                      height: 9.h,
                      child: const VerticalDivider(
                          color: AppColor.DividerColor, thickness: 1)),
                  SizedBox(
                    width: 20.w,
                    child: Column(
                      children: const [
                        Text('Starts At',
                            style: TextStyle(height: 3, fontSize: 12)),
                        Text('06:00 PM',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

///Sixth Container Live
class MyContainer6 extends StatelessWidget {
  const MyContainer6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 92.w,
      decoration: BoxDecoration(
          color: AppColor.light, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 5.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Zimbabwe vs Afghanistan",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                Image.asset(AppIcon.notification, height: 2.2.h)
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              '',
                            )),
                        SizedBox(width: 2.w),
                        const Text("ZIM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        SizedBox(width: 24.w),
                        const Text(
                          "133/7",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(width: 1.w),
                        const Text("(20)",
                            style:
                                TextStyle(color: AppColor.grey, fontSize: 10))
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                            radius: 15, backgroundImage: AssetImage('')),
                        SizedBox(width: 2.w),
                        const Text("ZIM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        SizedBox(width: 24.w),
                        const Text(
                          "133/7",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(width: 1.w),
                        Text("(20)",
                            style:
                                TextStyle(color: AppColor.grey, fontSize: 10))
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      children: [
                        Image.asset(
                          AppIcon.live,
                          height: 1.5.h,
                        ),
                        AppSizebox.w2,
                        Text(
                          "LIVE",
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                    height: 9.h,
                    child: const VerticalDivider(
                        color: AppColor.DividerColor, thickness: 1)),
                SizedBox(
                  width: 19.w,
                  child: Column(
                    children: const [
                      Text('72',
                          style: TextStyle(
                              height: 1.6,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: AppColor.green)),
                      Text('Prediction',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColor.green))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///Seventh Container IPLMatches
class MyContainer7 extends StatefulWidget {
  final String headerText;
  final String backgroundImage1;
  final String backgroundImage2;
  final String matchesname1;
  final String matchesname2;
  final String infoMsg;
  final String Over1;
  final String Over2;
  final String run1;
  final String run2;
  final String wk1;
  final String wk2;
  final String totalprediction;

  const MyContainer7({
    Key? key,
    required this.headerText,
    required this.backgroundImage1,
    required this.backgroundImage2,
    required this.matchesname1,
    required this.infoMsg,
    required this.Over1,
    required this.Over2,
    required this.matchesname2,
    required this.run1,
    required this.run2,
    required this.wk1,
    required this.wk2,
    required this.totalprediction,
  }) : super(key: key);

  @override
  State<MyContainer7> createState() => _MyContainer7State();
}

class _MyContainer7State extends State<MyContainer7> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('completedMatches');
      },
      child: Container(
        height: 20.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 4.w),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.headerText,
                          style: const TextStyle(
                              fontSize: 12, color: AppColor.greymin)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _value = !_value;
                          });
                        },
                        child: Container(
                            child: _value
                                ? const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  )
                                : const Icon(Icons.notifications_none,
                                    color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  // Container(
                                  //   height: 4.h,
                                  //   width: 8.5.w,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(50)),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(50),
                                  //     child: Image.network(
                                  //       widget.backgroundImage2,
                                  //       fit: BoxFit.cover,
                                  //       loadingBuilder:
                                  //           (context, child, loadingProgress) {
                                  //         if (loadingProgress == null)
                                  //           return child;
                                  //         return const Center(
                                  //             child: CircularProgressIndicator(
                                  //           color: Colors.green,
                                  //         ));
                                  //       },
                                  //       errorBuilder:
                                  //           (context, error, stackTrace) =>
                                  //               const Center(
                                  //         child: Text(
                                  //           "",
                                  //           style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 7),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  CircleAvatar(
                                    radius: 15, // Image radius
                                    backgroundImage: NetworkImage(
                                      widget.backgroundImage1,
                                    ),
                                  ),
                                  SizedBox(height: 1.5.h),
                                  CircleAvatar(
                                    radius: 15, // Image radius
                                    backgroundImage: NetworkImage(
                                      widget.backgroundImage2,
                                    ),
                                  ),
                                  // Container(
                                  //   height: 4.h,
                                  //   width: 8.5.w,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //           BorderRadius.circular(50)),
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(50),
                                  //     child: Image.network(
                                  //       widget.backgroundImage2,
                                  //       fit: BoxFit.cover,
                                  //       loadingBuilder:
                                  //           (context, child, loadingProgress) {
                                  //         if (loadingProgress == null)
                                  //           return child;
                                  //         return const Center(
                                  //             child: CircularProgressIndicator(
                                  //           color: Colors.green,
                                  //         ));
                                  //       },
                                  //       errorBuilder:
                                  //           (context, error, stackTrace) =>
                                  //               const Center(
                                  //         child: Text(
                                  //           "",
                                  //           style: TextStyle(
                                  //               color: Colors.white,
                                  //               fontSize: 7),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              SizedBox(width: 2.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.matchesname1,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                  SizedBox(height: 3.h),
                                  Text(widget.matchesname2,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.infoMsg,
                    maxLines: 1,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, color: AppColor.greymin),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 5.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${widget.run1}/${widget.wk1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          "${widget.run2}/${widget.wk2}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(width: 1.w),
                    Padding(
                      padding: EdgeInsets.only(top: 0.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("(${widget.Over1})",
                              style: const TextStyle(
                                  color: AppColor.grey, fontSize: 10)),
                          SizedBox(height: 3.5.h),
                          Text("(${widget.Over2})",
                              style: const TextStyle(
                                  color: AppColor.grey, fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 62.w, top: 3.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 10.h,
                        child: const VerticalDivider(
                            color: AppColor.DividerColor, thickness: 1)),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Column(
                        children: [
                          Text(widget.totalprediction,
                              style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.green)),
                          const Text('Predictions',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100,
                                  color: AppColor.green))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///8 option container
class OptionContainer extends StatelessWidget {
  final String text;

  const OptionContainer({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.light,
      child: ListTile(
        title: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14)),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}

///9 Expert Matches
class MyContainer8 extends StatelessWidget {
  const MyContainer8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 92.w,
      decoration: BoxDecoration(
          color: AppColor.light, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 4.w, right: 5.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Zimbabwe vs Afghanistan",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                Image.asset(AppIcon.info, height: 2.2.h)
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(
                              '',
                            )),
                        SizedBox(width: 2.w),
                        const Text("ZIM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        SizedBox(width: 24.w),
                        const Text(
                          "133/7",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(width: 1.w),
                        Text("(20)",
                            style:
                                TextStyle(color: AppColor.grey, fontSize: 10))
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                            radius: 15, backgroundImage: AssetImage('')),
                        SizedBox(width: 2.w),
                        const Text("ZIM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        SizedBox(width: 24.w),
                        const Text(
                          "133/7",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        SizedBox(width: 1.w),
                        const Text("(20)",
                            style:
                                TextStyle(color: AppColor.grey, fontSize: 10))
                      ],
                    ),
                    SizedBox(height: 1.5.h),
                  ],
                ),
                SizedBox(
                    height: 9.h,
                    child: const VerticalDivider(
                        color: AppColor.DividerColor, thickness: 1)),
                SizedBox(
                  width: 19.w,
                  child: Column(
                    children: const [
                      Text('#72',
                          style: TextStyle(
                              height: 1.6,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: AppColor.green)),
                      Text('Best Rank',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColor.green))
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sri Lanka Won By 20 Runs"),
                SizedBox(
                  width: 22.w,
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcon.group,
                        height: 1.5.h,
                      ),
                      AppSizebox.w5,
                      const Text("3 Teams"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///10 Matches-Fantasy-first container
class FantasyUpcoming extends StatelessWidget {
  const FantasyUpcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 12.5.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
                top: 3.2.h,
                left: 1.3.w,
                child: SizedBox(
                  width: 88.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 3.h,
                              child: Text("MI"),
                            ),
                            const Text('MI',
                                style: TextStyle(
                                    color: AppColor.greymin, fontSize: 18))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                        width: 24.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(AppString.matchTime,
                                style: TextStyle(
                                    color: AppColor.greymin, fontSize: 12)),
                            Text('5h 30m',
                                style: TextStyle(
                                    color: AppColor.greymin,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('RCB',
                                style: TextStyle(
                                    color: AppColor.greymin, fontSize: 18)),
                            CircleAvatar(
                              radius: 3.h,
                              child: Text("RCD"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}

///11 FantasySecondone
class FantasySecondone extends StatelessWidget {
  const FantasySecondone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10.w),
        height: 4.5.h,
        width: 45.5.w,
        decoration: const BoxDecoration(
            color: AppColor.light,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6), topLeft: Radius.circular(6))),
        child: Row(
          children: [
            Image.asset(
              AppIcon.sortby,
              height: 2.h,
              color: AppColor.green,
            ),
            AppSizebox.w5,
            const Text(
              AppString.avgS,
              style: TextStyle(color: AppColor.green),
            )
          ],
        ),
      ),
      onTap: () {
        Get.bottomSheet(
          MyBottomSheet(),
          backgroundColor: AppColor.light,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }
}

///12 FantasySecondtwo
class FantasySecondtwo extends StatefulWidget {
  const FantasySecondtwo({Key? key}) : super(key: key);

  @override
  State<FantasySecondtwo> createState() => _FantasySecondtwoState();
}

class _FantasySecondtwoState extends State<FantasySecondtwo> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      height: 4.5.h,
      width: 45.5.w,
      decoration: const BoxDecoration(
          color: AppColor.light,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(6), topRight: Radius.circular(6))),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            child: Container(
                child: _value
                    ? Row(
                        children: const [
                          Icon(Icons.favorite_border, color: Colors.green),
                          AppSizebox.w5,
                          Text(AppString.favourite,
                              style: TextStyle(color: Colors.green))
                        ],
                      )
                    : Row(
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          ),
                          AppSizebox.w5,
                          Text(
                            AppString.favourite,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}

///13 BestPicks
class BestPicksTile extends StatelessWidget {
  const BestPicksTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.light,
      ),
      child: ExpansionTile(
        collapsedIconColor: AppColor.greymin,
        title: Row(
          children: const [
            Text(
              "WK",
              style: TextStyle(fontSize: 15, color: AppColor.greymin),
            ),
            AppSizebox.w20,
            Text(
              "Wicket Keeper",
              style: TextStyle(fontSize: 14, color: AppColor.greymin),
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            child: Column(
              children: [
                Divider(height: 1, color: Colors.grey.shade700),
                AppSizebox.h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Player Name ",
                      style: TextStyle(fontSize: 11, color: AppColor.greymin),
                    ),
                    Text(
                      "Selected By",
                      style: TextStyle(fontSize: 11, color: AppColor.greymin),
                    )
                  ],
                ),
                AppSizebox.h10,
                Divider(height: 1, color: Colors.grey.shade700),
                Container(
                  height: 8.h,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage("asset/player/Player Profile.png"),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "SA Yadav",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.greymin,
                                height: 2.4),
                          ),
                          Text(
                            "MI",
                            style: TextStyle(
                                fontSize: 11, color: AppColor.greymin),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const Text(
                        "14.19%",
                        style: TextStyle(fontSize: 18, color: AppColor.greymin),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade700,
                  height: 1,
                ),
                Container(
                  height: 8.h,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("asset/player/1513.png"),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Virat kohli",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.greymin,
                                height: 2.4),
                          ),
                          Text(
                            "MI",
                            style: TextStyle(
                                fontSize: 11, color: AppColor.greymin),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const Text(
                        "154.19%",
                        style: TextStyle(fontSize: 18, color: AppColor.greymin),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey.shade700),
                Container(
                  height: 8.h,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.yellow,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Rohit Sharma",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.greymin,
                                height: 2.4),
                          ),
                          Text(
                            "RCB",
                            style: TextStyle(
                                fontSize: 11, color: AppColor.greymin),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const Text(
                        "194.19%",
                        style: TextStyle(fontSize: 18, color: AppColor.greymin),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///14 FantasyCompleted
class FantasyCompleted extends StatelessWidget {
  const FantasyCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 92.w,
      decoration: BoxDecoration(
          color: AppColor.light, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
              top: 3.2.h,
              left: 1.3.w,
              right: 1.3.w,
              child: SizedBox(
                width: 88.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 38.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 3.h,
                            child: Text("RCD"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('RCD',
                                  style: TextStyle(
                                      color: AppColor.greymin,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900)),
                              Row(
                                children: const [
                                  Text("135-7",
                                      style: TextStyle(
                                          color: AppColor.greymin,
                                          fontSize: 20)),
                                  AppSizebox.w5,
                                  Text("(15.4)",
                                      style: TextStyle(
                                          color: AppColor.greymin,
                                          fontSize: 10)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "asset/icon/light.png",
                      height: 2.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 37.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('MI',
                                  style: TextStyle(
                                      color: AppColor.greymin,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900)),
                              Row(
                                children: const [
                                  Text("135-7",
                                      style: TextStyle(
                                          color: AppColor.greymin,
                                          fontSize: 20)),
                                  AppSizebox.w5,
                                  Text("(15.4)",
                                      style: TextStyle(
                                          color: AppColor.greymin,
                                          fontSize: 10)),
                                ],
                              )
                            ],
                          ),
                          CircleAvatar(
                            radius: 3.h,
                            child: Text("MI"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class Commentary extends StatelessWidget {
  const Commentary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text("20.1"),
            AppSizebox.w20,
            Text("Marco jamsen to harshal Patel")
          ],
        ),
        AppSizebox.h5,
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.orange,
              child: Text("1"),
            ),
            SizedBox(
              width: 7.w,
            ),
            Text("1 run.")
          ],
        )
      ],
    );
  }
}

class Scorecard extends StatelessWidget {
  List iplteam = [
    'Delhi Capitalls',
    'Chennai Super kings',
    'Royal Challengers Banglore',
    'Mumbai Indians',
    'Rajasthan Royals',
    'kings XI Punjab',
    'Kolkata Knight Riders',
    'Sunrisers Hyderabad'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.light,
      ),
      child: ExpansionTile(
        collapsedIconColor: AppColor.greymin,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Mumbai Indians",
              style: TextStyle(fontSize: 15, color: AppColor.greymin),
            ),
            Text(
              "159 - 9 (20.0)",
              style: TextStyle(fontSize: 14, color: AppColor.greymin),
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 43.w, child: const Text('Teams')),
                          const Text('M',
                              style: TextStyle(color: Colors.white)),
                          const Text('W'),
                          const Text('L'),
                          const Text('Points'),
                          const Text('NRR')
                        ])),
                SizedBox(
                  child: Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: iplteam.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                                height: 6.h,
                                margin: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Divider(
                                        height: 1, color: Colors.grey.shade700),
                                    AppSizebox.h10,
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 42.w,
                                              child: Text(iplteam[index],
                                                  maxLines: 2)),
                                          const Text('14'),
                                          const Text('12'),
                                          const Text('2'),
                                          const Text('24'),
                                          SizedBox(
                                              width: 12.w,
                                              child: const Text('+1.000')),
                                        ])
                                  ],
                                ));
                          })),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyContainer22 extends StatefulWidget {
  final String headerText;
  final String subscribers;
  final String backgroundImage;
  final String wins;
  final String pr;
  final String ave;
  final Icon iconButton;
  final VoidCallback onTap;

  const MyContainer22(
      {Key? key,
      required this.backgroundImage,
      required this.headerText,
      required this.subscribers,
      required this.ave,
      required this.wins,
      required this.pr,
      required this.iconButton,
      required this.onTap})
      : super(key: key);

  @override
  State<MyContainer22> createState() => _MyContainer22State();
}

class _MyContainer22State extends State<MyContainer22> {
  bool _value = false;

  final ExpertsController expertsController = Get.find();

  void submitDate() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17.h,
      width: 92.w,
      decoration: BoxDecoration(
          color: AppColor.light, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            top: 1.5.h,
            left: 4.w,
            child: SizedBox(
              height: 6.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      widget.backgroundImage,
                      width: 45,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AppSizebox.w5,
                  Padding(
                    padding: EdgeInsets.only(top: 0.8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.headerText,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Image.asset(AppIcon.uTube, height: 1.h),
                            AppSizebox.w2,
                            Text(
                              widget.subscribers,
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 1.h,
            left: 78.w,
            child: IconButton(
              splashColor: Colors.transparent,
              icon: widget.iconButton,
              onPressed: widget.onTap,

              // Obx(() => IconButton(
              //   onPressed: () {
              //     if (product.inWishList?.value == false) {
              //       expertsController.addItem(product.name ?? "");
              //     } else {
              //       expertsController.removeItem(product.name ?? "");
              //     }
              //   },
              //   icon: Icon(
              //     Icons.favorite,
              //     color: product.inWishList?.value == false
              //         ? Colors.white
              //         : Colors.red,
              //   ),
              // )),

              //     InkWell(
              //   onTap: () {
              //     setState(() {
              //       _value = !_value;
              //     });
              //   },
              //   child: Container(
              //     child: _value
              //         ? IconButton(
              //             icon: const Icon(
              //               Icons.favorite,
              //               color: Colors.green,
              //             ),
              //             onPressed: () {
              //               submitDate();
              //             },
              //           )
              //         : const Icon(Icons.favorite_border, color: Colors.green),
              //   ),
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 5.w, right: 6.w),
            child: SizedBox(
              height: 7.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.pr,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GothamPro",
                            color: AppColor.greymin),
                      ),
                      const Text(
                        AppString.prediction,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      )
                    ],
                  ),
                  const VerticalDivider(
                      width: 2,
                      color: AppColor.dBlack,
                      thickness: 1,
                      endIndent: 10,
                      indent: 10),
                  Column(
                    children: [
                      Text(
                        widget.ave,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: "GothamPro",
                          color: AppColor.greymin,
                        ),
                      ),
                      const Text(
                        AppString.avgScore,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                      width: 2,
                      color: AppColor.dBlack,
                      thickness: 1,
                      endIndent: 10,
                      indent: 10),
                  Column(
                    children: [
                      Text(
                        widget.wins,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: "GothamPro",
                          color: AppColor.greymin,
                        ),
                      ),
                      const Text(
                        AppString.wins,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyContainer23 extends StatefulWidget {
  @override
  State<MyContainer23> createState() => _MyContainer23State();
}

class _MyContainer23State extends State<MyContainer23> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('expertinfo');
      },
      child: Container(
        // height: 14.h,
        width: 92.w,
        decoration: BoxDecoration(
            color: AppColor.light, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.h, left: 4.w),
              child: SizedBox(
                height: 7.h,
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://yt3.ggpht.com/ytc/AKedOLQZKvC4YtSgcsOZ-O--Nqhp6FEIv-pCBpywzpuHDw=s900-c-k-c0x00ffffff-no-rj"),
                      radius: 25,
                    ),
                    AppSizebox.w5,
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Prediction Bhajan",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              Image.asset(AppIcon.uTube, height: 1.h),
                              AppSizebox.w2,
                              Text(
                                "subscribers",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.5.h, left: 80.w),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _value = !_value;
                  });
                },
                child: Container(
                    child: _value
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.green,
                          )
                        : Icon(Icons.favorite_border, color: Colors.green)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h, left: 5.w, right: 6.w),
              child: SizedBox(
                height: 7.h,
                // width: 85.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: const [
                      Text("234",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GothamPro",
                              color: AppColor.greymin)),
                      Text(
                        AppString.prediction,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      )
                    ]),
                    const VerticalDivider(
                        width: 2,
                        color: AppColor.dBlack,
                        thickness: 1,
                        endIndent: 10,
                        indent: 10),
                    Column(children: const [
                      Text("2342",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GothamPro",
                            color: AppColor.greymin,
                          )),
                      Text(
                        AppString.avgScore,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      )
                    ]),
                    const VerticalDivider(
                        width: 2,
                        color: AppColor.dBlack,
                        thickness: 1,
                        endIndent: 10,
                        indent: 10),
                    Column(children: const [
                      Text("23",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GothamPro",
                            color: AppColor.greymin,
                          )),
                      Text(
                        AppString.wins,
                        style: TextStyle(
                          color: AppColor.greymin,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          // fontFamily: "GothamPro",
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget {
  MyAppBar({Key? key, required this.text, required this.login})
      : super(key: key);

  String text;
  String login;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  LoginData _loginData = Get.put(LoginData());
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
          _loginData.isLogin == true
              ? Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(ProfileData());
                      },
                      child: ClipOval(
                        child: Image.network(
                          user?.photoURL ?? "",
                          width: 25,
                          height: 25,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                                child: CircularProgressIndicator(
                              color: Colors.green,
                            ));
                          },
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: ClipOval(
                              child: Image.asset(
                                "asset/Images/profileimages.png",
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  AppSizebox.w15,
                  GestureDetector(
                      onTap: () {
                        Get.to(WishListScreen());
                      },
                      child: Icon(Icons.favorite_border,color: Colors.white,))
                ],
              )
              : GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22.sp),
                          topRight: Radius.circular(22.sp),
                        ),
                      ),
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: (AppColor.light),
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Container(
                            height: 75.h,
                            decoration: BoxDecoration(
                              color: AppColor.light,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(22.sp),
                                topRight: Radius.circular(22.sp),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(right: 4.w, left: 4.w),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 85.w, top: 3.h),
                                      child: GestureDetector(
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 4.h,
                                        ),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 4.w, right: 4.w, top: 5.h),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 112,
                                            width: 112,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              //border: Border.all(width: 2,color: Colors.green),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.8.w, top: 0.4.h),
                                            child: Container(
                                              height: 106,
                                              width: 106,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 3,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "asset/Images/fantips_logo_12png.png"))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Divider(
                                                  color: Colors.grey.shade700)),
                                          AppSizebox.w10,
                                          const Text(
                                            "LET'S CONNECT",
                                            style: TextStyle(
                                                color: AppColor.greymin,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          AppSizebox.w10,
                                          Expanded(
                                            child: Divider(
                                                color: Colors.grey.shade700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        final provider =
                                            Provider.of<GoogleSignInProvider>(
                                                context,
                                                listen: false);
                                        provider.googleLogin().whenComplete(() {
                                          setState(() {

                                          _loginData.isLogin = true;
                                          });
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    (ProfileData())),
                                          );
                                        });
                                      },
                                      child: Container(
                                        height: 7.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: const [
                                            AppSizebox.w20,
                                            CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: AssetImage(
                                                  "asset/Images/google-logo.png"),
                                            ),
                                            AppSizebox.w15,
                                            Text(
                                              "Sign in with Google",
                                              style: TextStyle(
                                                  color: AppColor.greymin,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      height: 7.h,
                                      width: 75.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        children: const [
                                          AppSizebox.w20,
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                "asset/Images/facebook_logo.png"),
                                          ),
                                          AppSizebox.w15,
                                          Text(
                                            "Sign in with Facebook",
                                            style: TextStyle(
                                                color: AppColor.greymin,
                                                fontSize: 13),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    widget.login,
                    style: const TextStyle(color: AppColor.green, fontSize: 15),
                  ),
                ),
      ],
    );
  }
}

class MyAppBar1 extends StatefulWidget {
  MyAppBar1({required this.login, required this.text, required this.image});

  String text;
  String login;
  String image;

  @override
  State<MyAppBar1> createState() => _MyAppBar1State();
}

class _MyAppBar1State extends State<MyAppBar1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Expanded(flex: 2, child: Container()),
        Text(
          widget.login,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color(0xFF25C06D),
              height: 0),
        ),
        Expanded(child: Container()),
        InkWell(
          child: Image.asset(
            widget.image,
            height: 2.4.h,
          ),
          onTap: () {
            Get.toNamed('search');
          },
        )
      ],
    );
  }
}

class ProfileAppbar extends StatefulWidget {
  ProfileAppbar({required this.text, required this.logout, required this.icon});

  IconData icon;
  String text;
  String logout;

  @override
  _ProfileAppbarState createState() => _ProfileAppbarState();
}

class _ProfileAppbarState extends State<ProfileAppbar> {
  final LoginData _loginData = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              widget.icon,
              color: AppColor.greymin,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          // Expanded(flex: 2, child: Container()),
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColor.greymin,
            ),
          ),
          Expanded(child: Container()),
          // SizedBox(
          //   width: 46.w,
          // ),
          GestureDetector(
            onTap: () {
              setState(() {

              _loginData.isLogin = false;
              });
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout().whenComplete(() => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (HomeMain())),
                  ));
            },
            child: Text(
              widget.logout,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColor.greymin,
                // color: Color(0xFF25C06D),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
