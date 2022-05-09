import 'dart:developer';
import 'package:fantips/Screens/Experts/ExperInfo/Expertinfo.dart';
import 'package:fantips/Screens/Experts/Experts.dart';
import 'package:fantips/Screens/Experts/controller/ExpertsController.dart';
import 'package:fantips/Screens/Home/News/HomeNews.dart';
import 'package:fantips/Screens/Home/ViewAll/ViewAll.dart';
import 'package:fantips/Screens/IPL/Ipl.dart';
import 'package:fantips/Screens/Matches/Matches.dart';
import 'package:fantips/Screens/Matches/Upcoming/Controller/Upcoming_Controller.dart';
import 'package:fantips/Screens/More/More.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppIcon.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:fantips/Widgets/MyTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

import 'News/Controller/News_Controller.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _currentIndex = 0;
  List body = [
    const Home(),
    const Matches_Screen(),
    const Ipl(),
    const Experts(),
    const More(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: AppColor.grey,
        selectedItemColor: AppColor.white,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcon.home),
            ),
            label: AppString.home,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(AppIcon.match),
            ),
            label: AppString.matches,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                AppIcon.ipl,
              ),
            ),
            label: AppString.ipl,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppString.exports,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: AppString.more,
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NewsController _NewsController = Get.put(NewsController());
  final ExpertsController expertsController = Get.put(ExpertsController());
  final UpcomingController upcomingController = Get.put(UpcomingController());
  final int pageindex = 0;

  static String hourAndMin(int milliSecond) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(milliSecond);
    final dt =
        DateTime(date.year, date.month, date.day, date.hour, date.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  bool value1 = false;
  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[800],
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
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
                    child: MyAppBar(text: AppString.fanTips, login: AppString.logIn,),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSizebox.h15,
                        const MyTitle(text: AppString.matchesForyou),
                        AppSizebox.h15,
                        SizedBox(
                          height: 20.h,
                          width: 100.w,
                          child: Obx(
                            () => upcomingController.isLoading.value
                                ? Center(
                                    child: Container(
                                      height: 3.h,
                                      width: 4.w,
                                      child: const LoadingIndicator(
                                          indicatorType: Indicator.lineSpinFadeLoader,
                                          colors: [Colors.white],
                                          strokeWidth: 1,
                                          backgroundColor: Colors.black,
                                          pathBackgroundColor: Colors.black),
                                    ),
                                  )
                                : PageView.builder(
                                    onPageChanged: (value) {
                                      upcomingController.matchSelect.value = value;
                                    },
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      final completeData = upcomingController
                                          .getUpcoming
                                          .value
                                          .matches
                                          ?.notstarted?[index];
                                      final ff = DateFormat.jm();

                                      return Padding(
                                        padding:
                                            EdgeInsets.only(left: 4.w, right: 4.w),
                                        child: MyContainer4(
                                            headerText: completeData?.header ?? "",
                                            backgroundImage1:
                                                "${completeData?.t1Flag}",
                                            backgroundImage2:
                                                "${completeData?.t2Flag}",
                                            matchesname1:
                                                "${completeData?.team1Name}",
                                            matchesname2:
                                                "${completeData?.team2Name}",
                                            infoMsg: ff.format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  completeData?.startTime ?? 0),
                                            ),
                                            totalprediction:
                                                completeData?.totalprediction != 0
                                                    ? "Predictions"
                                                    : ff.format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            completeData?.startTime ??
                                                                0)),
                                            Starts: completeData?.totalprediction != 0
                                                ? "${completeData?.totalprediction}"
                                                : "Starts At"),
                                      );
                                    },
                                  ),
                          ),
                        ),
                        AppSizebox.h10,
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                              (index) => Container(
                                height: 0.6.h,
                                width: upcomingController.matchSelect.value == index
                                    ? 4.w
                                    : 3.w,
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  color: upcomingController.matchSelect.value == index
                                      ? Colors.green
                                      : AppColor.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSizebox.h15,
                        const MyTitle(text: AppString.featuredExperts),
                        AppSizebox.h15,
                        SizedBox(
                          height: 18.h,
                          width: 100.w,
                          child: Obx(
                            () => expertsController.isLoading.value
                                ? Center(
                                    child: Container(
                                      height: 3.h,
                                      width: 4.w,
                                      child: const LoadingIndicator(
                                          indicatorType: Indicator.lineSpinFadeLoader,
                                          colors: [Colors.white],
                                          strokeWidth: 1,
                                          backgroundColor: Colors.black,
                                          pathBackgroundColor: Colors.black),
                                    ),
                                  )
                                : PageView.builder(
                                    onPageChanged: (value) {
                                      expertsController.matchSelect.value = value;
                                    },
                                    itemCount: expertsController.getitem.value == true
                                        ? expertsController.getitem.length
                                        : 5,
                                    // itemCount: expertsController.getitem.value.length,
                                    itemBuilder: (BuildContext context, index) {
                                      log("Service111111-------${expertsController.getitem.length}");
                                      final Experts =
                                          expertsController.getitem.value[index];

                                      return Padding(
                                        padding:
                                            EdgeInsets.only(left: 4.w, right: 4.w),
                                        child: GestureDetector(
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
                                          child: Obx(
                                            () => MyContainer22(
                                              headerText:
                                                  "${Experts.name!.length >= 25 ? Experts.name?.substring(0, 12) : Experts.name}",
                                              pr: "${Experts.totalPredictions ?? " "}",
                                              ave: "${Experts.avgScore ?? ""}",
                                              wins: "${Experts.top3}",
                                              subscribers:
                                                  '${Experts.subscriberCount}',
                                              backgroundImage:
                                                  Experts.profileUrl ?? "",
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
                                                          .value[index].inWishList ==
                                                      true
                                                  ? const Icon(
                                                      Icons.favorite,
                                                      color: Colors.green,
                                                    )
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.green,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                        AppSizebox.h10,
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Container(
                                height: 0.6.h,
                                width: expertsController.matchSelect.value == index
                                    ? 4.w
                                    : 3.w,
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  color: expertsController.matchSelect.value == index
                                      ? Colors.green
                                      : AppColor.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppSizebox.h15,
                        Row(
                          children: [
                            const MyTitle(text: AppString.topStories),
                            Expanded(child: Container()),
                            GestureDetector(
                                onTap: () {
                                  Get.to(const ViewAll());
                                },
                                child: const Text(AppString.viewAll,
                                    style: TextStyle(fontSize: 12))),
                            const Icon(Icons.arrow_forward_ios_sharp,
                                color: Colors.white, size: 12),
                            AppSizebox.w15
                          ],
                        ),
                        AppSizebox.h15,
                        SizedBox(
                          child: ListView.builder(
                            itemCount: 5,
                            //_NewsController.getNews.value.news?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                                child: Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        HomeNews(
                                          newimage: _NewsController
                                              .getNews.value.news?[index].image,
                                          newname: _NewsController
                                              .getNews.value.news?[index].title,
                                          newstime: _NewsController
                                              .getNews.value.news?[index].time,
                                          samlldata:
                                              "${_NewsController.getNews.value.news?[index].smallDesc}",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 38.h,
                                      width: 92.w,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 20.h,
                                            width: 90.w,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  20), // Image border
                                              child: SizedBox.fromSize(
                                                size: Size.fromRadius(48),
                                                child: Image.network(
                                                  _NewsController.getNews.value
                                                          .news?[index].image ??
                                                      "",
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context, child,
                                                      loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Center(
                                                      child: Container(
                                                        height: 3.h,
                                                        width: 6.w,
                                                        child: const LoadingIndicator(
                                                            indicatorType: Indicator
                                                                .lineSpinFadeLoader,
                                                            colors: [Colors.white],
                                                            strokeWidth: 1,
                                                            backgroundColor:
                                                                Colors.black,
                                                            pathBackgroundColor:
                                                                Colors.black),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      const Center(child: Text("")),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Container(
                                          //   decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(20),
                                          //     // image: DecorationImage(
                                          //     //     image: NetworkImage(
                                          //     //         _NewsController.getNews.value
                                          //     //                 .news?[index].image ??
                                          //     //             "",scale: 1),
                                          //     //     fit: BoxFit.cover)
                                          //   ),
                                          //   height: 20.h,
                                          //   width: 90.w,
                                          //   child: Image.network(
                                          //     _NewsController.getNews.value
                                          //             .news?[index].image ??
                                          //         "",
                                          //     fit: BoxFit.cover,
                                          //     loadingBuilder:
                                          //         (context, child, loadingProgress) {
                                          //       if (loadingProgress == null)
                                          //         return child;
                                          //       return const Center(
                                          //           child: CircularProgressIndicator(
                                          //         color: Colors.green,
                                          //       ));
                                          //     },
                                          //     errorBuilder:
                                          //         (context, error, stackTrace) =>
                                          //             const Center(child: Text("")),
                                          //   ),
                                          // ),
                                          Column(
                                            children: [
                                              Container(
                                                height: 16.h,
                                                padding: const EdgeInsets.fromLTRB(
                                                    8, 8, 8, 0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        _NewsController.getNews.value
                                                                .news?[index].title ??
                                                            "",
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 15)),
                                                    Text(
                                                        _NewsController
                                                                .getNews
                                                                .value
                                                                .news?[index]
                                                                .smallDesc ??
                                                            "",
                                                        maxLines: 2,
                                                        style: const TextStyle(
                                                          color: AppColor.greymin,
                                                          fontSize: 12,
                                                        )),
                                                    Text(
                                                        _NewsController
                                                                .getNews
                                                                .value
                                                                .news?[index]
                                                                .newsSource ??
                                                            "",
                                                        style: const TextStyle(
                                                            color: AppColor.grey,
                                                            fontSize: 12)),
                                                    Text(
                                                        displayTimeAgoFromTimestamp(
                                                            _NewsController
                                                                    .getNews
                                                                    .value
                                                                    .news?[index]
                                                                    .time ??
                                                                0),
                                                        style: const TextStyle(
                                                            color: AppColor.grey,
                                                            fontSize: 10)),
                                                  ],
                                                ),
                                              ),
                                              AppSizebox.h10,
                                              const Divider(
                                                height: 2,
                                                color: AppColor.DividerColor,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String displayTimeAgoFromTimestamp(int time, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    final currentDate = DateTime.now();
    final difference = currentDate.difference(date);
    log("date ---> $date");
    log("currentDate ---> $currentDate");
    log("difference ---> $difference");
    String result = '';
    if (difference.inDays >= 365) {
      result = '${difference.inDays ~/ 365}y';
    } else if (difference.inDays == 1) {
      result = (numericDates) ? '1 days ago' : 'Yesterday';
    } else if (difference.inDays > 1) {
      result = (numericDates) ? '${difference.inDays}d' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      result = '${difference.inHours} hours';
    } else if (difference.inHours >= 1) {
      result = (numericDates) ? '${difference.inHours}h' : 'An hour ago';
    } else if (difference.inMinutes >= 1) {
      result = '${difference.inMinutes} minutes';
    } else if (difference.inMinutes >= 1) {
      result = (numericDates) ? '${difference.inMinutes}m' : 'A minute ago';
    } else if (difference.inSeconds >= 1) {
      result = '${difference.inSeconds} seconds';
    } else if (difference.inSeconds == 0) {
      result = '0s';
    } else {
      final DateFormat formatter = DateFormat("yyyy-MM-dd");
      result = formatter.format(date);
      log("result :- $result");
    }
    return result;
  }
}
