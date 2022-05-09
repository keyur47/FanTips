import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PointTable extends StatelessWidget {
  const PointTable({Key? key}) : super(key: key);

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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: iplteam.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Divider(height: 1, color: Colors.grey.shade700),
                            AppSizebox.h10,
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 42.w,
                                    child: Text(iplteam[index], maxLines: 2)),
                                const Text('14'),
                                const Text('12'),
                                const Text('2'),
                                const Text('24'),
                                SizedBox(
                                  width: 12.w,
                                  child: const Text('+1.000'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
