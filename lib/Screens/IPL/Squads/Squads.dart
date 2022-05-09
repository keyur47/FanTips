import 'package:fantips/Screens/IPL/Squads/SquadsTeam.dart';
import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';


class Squads extends StatelessWidget {
  const Squads({Key? key}) : super(key: key);

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

    List<String> tem = [
      "Delhi Capitalls",
      "Chennai Super kings",
      "Royal Challengers Banglore",
      "Mumbai Indians",
      "Rajasthan Royals",
      "kings XI Punjab",
      "Kolkata Knight Riders",
      "Sunrisers Hyderabad",
      "Rajasthan Royals",
      "kings XI Punjab",
      "Kolkata Knight Riders",
      "Sunrisers Hyderabad"
    ];
    List<String> image = [
      "https://cricketaddictor.gumlet.io/wp-content/uploads/2021/07/Rahul-Dravid-3.jpg?compress=true&quality=80&w=480&dpr=2.6",
      "https://sm.imgix.net/21/14/cricket-player-strike.jpg",
      "https://p.imgci.com/db/PICTURES/CMS/285800/285875.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVHDLgZJaaiHYKpyU8kLRWpFXXhwTyw3SIqQ&usqp=CAU",
      "https://www.sportsunfold.com/wp-content/uploads/2021/10/MS-Dhoni.jpg",
      "https://www.crictracker.com/wp-content/uploads/2021/03/Virat-Kohli-fifty.jpg",
      "https://cricketaddictor.gumlet.io/wp-content/uploads/2021/07/Rahul-Dravid-3.jpg?compress=true&quality=80&w=480&dpr=2.6",
      "https://sm.imgix.net/21/14/cricket-player-strike.jpg",
      "https://p.imgci.com/db/PICTURES/CMS/285800/285875.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVHDLgZJaaiHYKpyU8kLRWpFXXhwTyw3SIqQ&usqp=CAU",
      "https://www.sportsunfold.com/wp-content/uploads/2021/10/MS-Dhoni.jpg",
      "https://www.crictracker.com/wp-content/uploads/2021/03/Virat-Kohli-fifty.jpg",
    ];
    return WillPopScope(
     onWillPop: _onWillPop,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AppSizebox.h10,
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) => GestureDetector(

                onTap: (){Get.to(SquadsTeam(name: tem[index]));},

                child: Padding(
                  padding: EdgeInsets.only(top: 0.8.h, left: 3.w, right: 3.w),
                  child: Container(
                    height: 7.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.light),
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Row(
                        children: [
                           CircleAvatar(
                            backgroundImage: NetworkImage(image[index]),
                            radius: 18,
                          ),
                          AppSizebox.w10,
                          Text(
                            tem[index],
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
