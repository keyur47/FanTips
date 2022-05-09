import 'dart:developer';

import 'package:fantips/Screens/Home/News/Controller/News_Controller.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class HomeNews extends StatefulWidget {
  HomeNews(
      {this.newimage,
      this.newname,
      required this.samlldata,
      required this.newstime});

  String? newimage;
  String? newname;
  String? samlldata;
  int? newstime;

  @override
  _HomeNewsState createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> with TickerProviderStateMixin {
  final NewsController newsController = Get.find();

  late AnimationController ColorAnimationController;
  late AnimationController TextAnimationController;
  late Animation colorTween, iconColorTween;
  late Animation<Offset> transTween;

  @override
  void initState() {
    ColorAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
    colorTween = ColorTween(begin: Colors.transparent, end: Colors.black)
        .animate(ColorAnimationController);
    iconColorTween = ColorTween(begin: Colors.white, end: Colors.white)
        .animate(ColorAnimationController);

    TextAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));

    transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(TextAnimationController);

    super.initState();
  }

  bool scrollListeners(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 130);

      TextAnimationController.animateTo((scrollInfo.metrics.pixels - 130) / 1);
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NotificationListener<ScrollNotification>(
        onNotification: scrollListeners,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 30.h,
                    width: 100.w,
                    child: Image.network(
                      "${widget.newimage}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.h),
                    child: Container(
                      width: 100.w,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${widget.newname}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14)),
                            AppSizebox.h10,
                            Text("${widget.samlldata}",
                                style: const TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500)),
                            AppSizebox.h10,
                            Text(
                                displayTimeAgoFromTimestamp(
                                    widget.newstime ?? 0),
                                style: const TextStyle(
                                    color: AppColor.grey, fontSize: 10)),
                            ListView.builder(
                                itemCount:
                                    newsController.getNews.value.news?.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Text(
                                    "${newsController.getNews.value.news?[index].smallDesc}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  );
                                }),
                            AppSizebox.h5,
                            AppSizebox.h20,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10.h,
              child: AnimatedBuilder(
                animation: ColorAnimationController,
                builder: (context, child) => AppBar(
                  backgroundColor: colorTween.value,
                  elevation: 0,
                  titleSpacing: 0.0,
                  title: Transform.translate(
                    offset: transTween.value,
                    child: const Text(
                        'BCCI Secretary Arun Dhumal loss to the tune to thge matches... ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                  // iconTheme: IconThemeData(
                  //   color: iconColorTween.value,
                  // ),
                ),
              ),
            ),
          ],
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
