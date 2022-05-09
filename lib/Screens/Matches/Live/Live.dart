import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Controller/Live_Controller.dart';

class Live extends StatefulWidget {
  const Live({Key? key}) : super(key: key);

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  final LiveController _liveController = Get.put(LiveController());

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/player/Placeholder.png"),
              const Text("No matches available",style: TextStyle(fontWeight: FontWeight.w100),)
            ],
          ),
        ),

        // child: Obx(
        //       () =>
        //       Padding(
        //         padding: EdgeInsets.only(top: 2.h),
        //         child: Column(
        //           children: [
        //             Flexible(
        //               child: ListView.builder(
        //                 itemCount: _liveController
        //                     .getLive.value.matches?.started?.length,
        //                 itemBuilder: (context, index) {
        //                   final completeData = _liveController
        //                       .getLive.value.matches?.started?[index];
        //                   final f = DateFormat('EEEEEE, d MMM');
        //                   final ff = DateFormat.jm();
        //
        //                   return Padding(
        //                     padding: EdgeInsets.only(top: 1.h),
        //                     child: Column(
        //                       children: [
        //                         Center(
        //                           child: Text(
        //                             f.format(
        //                                 DateTime.fromMillisecondsSinceEpoch(
        //                                     completeData?.startTime ?? 0)),
        //                             style: const TextStyle(
        //                                 color: Colors.grey,
        //                                 fontSize: 15,
        //                                 fontWeight: FontWeight.w400),
        //                           ),
        //                         ),
        //                         AppSizebox.h10,
        //                         // MyContainer4(
        //                         //   headerText: completeData?.header ?? "",
        //                         //   backgroundImage1:
        //                         //   NetworkImage("${completeData?.t1Flag}"),
        //                         //   backgroundImage2: "${completeData?.t2Flag}",
        //                         //   matchesname1: "${completeData?.team1Name}",
        //                         //   matchesname2: "${completeData?.team2Name}",
        //                         //   infoMsg: ff.format(DateTime.fromMillisecondsSinceEpoch(
        //                         //       completeData?.startTime ?? 0),),
        //                         //   totalprediction:
        //                         //   ff.format(DateTime.fromMillisecondsSinceEpoch(
        //                         //       completeData?.startTime ?? 0)),
        //                         // ),
        //                         MyContainer6(),
        //                         AppSizebox.h5
        //                       ],
        //                     ),
        //                   );
        //                 },
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        // ));
      ),
    );
  }
}
