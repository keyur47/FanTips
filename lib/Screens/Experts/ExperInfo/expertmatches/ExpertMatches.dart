import 'package:fantips/Screens/Matches/Completed/Controller/Completed_Controller.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:fantips/Widgets/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

class ExpertMatches extends StatefulWidget {
  const ExpertMatches({Key? key}) : super(key: key);

  @override
  State<ExpertMatches> createState() => _ExpertMatchesState();
}

class _ExpertMatchesState extends State<ExpertMatches> {
  final CompletedController _completedController =
      Get.put(CompletedController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => _completedController.isLoading.value
            ? Center(
                child: Container(
                  height: 3.h,
                  width: 6.w,
                  child: const LoadingIndicator(
                      indicatorType: Indicator.lineSpinFadeLoader,
                      colors: [Colors.white],
                      strokeWidth: 1,
                      backgroundColor: Colors.black,
                      pathBackgroundColor: Colors.black),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: _completedController
                            .getCompleted.value.matches?.completed?.length,
                        itemBuilder: (context, index) {
                          final completeData = _completedController
                              .getCompleted.value.matches?.completed?[index];
                          final f = DateFormat('EEEEEE, d MMM');

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
                                MyContainer7(
                                  headerText: completeData?.header ?? "",
                                  backgroundImage1:
                                      "${completeData?.t1Flag}",
                                  backgroundImage2: "${completeData?.t2Flag}",
                                  matchesname1: "${completeData?.team1Name}",
                                  matchesname2: "${completeData?.team2Name}",
                                  infoMsg: '${completeData?.infoMsg}',
                                  Over1: "${completeData?.t2Over}",
                                  Over2: "${completeData?.t1Over}",
                                  run1: "${completeData?.t1Run}",
                                  run2: "${completeData?.t2Run}",
                                  wk2: "${completeData?.t1Wk}",
                                  wk1: "${completeData?.t2Wk}",
                                  totalprediction:
                                      "${completeData?.totalprediction}",
                                ),
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
      ),
    );
  }
}
