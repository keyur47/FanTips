import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Util/AppColor.dart';
import '../../../Util/Sizebox.dart';

class SquadsTeam extends StatefulWidget {
  SquadsTeam({required this.name});

  String? name;

  @override
  _SquadsTeamState createState() => _SquadsTeamState();
}

class _SquadsTeamState extends State<SquadsTeam> {
  List<String> tem = [
    "Rahul Ravinder",
    "SA Yadav",
    "Rohit Sharma",
    "Chris Lynn",
    "SS Tiwary",
    "Tim David",
    "Rahul Ravinder",
    "SA Yadav",
    "Rohit Sharma",
    "Chris Lynn",
    "SS Tiwary",
    "Tim David",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      appBar: AppBar(
        backgroundColor: AppColor.light,
        title: Text("${widget.name}"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizebox.h15,
              Text("BATSMEN"),
              AppSizebox.h20,
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image[index]),
                          radius: 18,
                        ),
                        AppSizebox.w10,
                        Text(
                          tem[index],
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    AppSizebox.h15
                  ],
                ),
              ),
              AppSizebox.h15,
              Text("All ROUNDER"),
              AppSizebox.h25,
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image[index]),
                          radius: 18,
                        ),
                        AppSizebox.w10,
                        Text(
                          tem[index],
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    AppSizebox.h15
                  ],
                ),
              ),
              AppSizebox.h15,
              Text("BOWLER"),
              AppSizebox.h25,
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image[index]),
                          radius: 18,
                        ),
                        AppSizebox.w10,
                        Text(
                          tem[index],
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    AppSizebox.h15
                  ],
                ),
              ),
              AppSizebox.h15,
              Text("WICKER KEEPER"),
              AppSizebox.h25,
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(image[index]),
                          radius: 18,
                        ),
                        AppSizebox.w10,
                        Text(
                          tem[index],
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    AppSizebox.h15
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
