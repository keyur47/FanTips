import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

import 'Controller/Upcoming_Controller.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final UpcomingController _upcomingController = Get.put(UpcomingController());

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
      child: SafeArea(
          child: Obx(
        () => _upcomingController.isLoading.value
            ? Center(
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
                ))
            : Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: _upcomingController
                            .getUpcoming.value.matches?.notstarted?.length,
                        itemBuilder: (context, index) {
                          final completeData = _upcomingController
                              .getUpcoming.value.matches?.notstarted?[index];
                          final f = DateFormat('EEEEEE, d MMM');
                          final ff = DateFormat.jm();

                          return Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    f.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            completeData?.startTime ?? 0)),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                AppSizebox.h10,
                                MyContainer4(
                                    headerText: completeData?.header ?? "",
                                    backgroundImage1: "${completeData?.t1Flag}",
                                    backgroundImage2: "${completeData?.t2Flag}",
                                    matchesname1: "${completeData?.team1Name}",
                                    matchesname2: "${completeData?.team2Name}",
                                    infoMsg: ff.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          completeData?.startTime ?? 0),
                                    ),
                                    totalprediction: completeData?.totalprediction != 0
                                        ? "Predictions" : ff.format(DateTime.fromMillisecondsSinceEpoch(completeData?.startTime ?? 0)),

                                    Starts: completeData?.totalprediction!=0?"${completeData?.totalprediction}":"Starts At"),

                                AppSizebox.h5
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      )),
    );
  }
}
