import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MyTeams extends StatelessWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text("SMART TEAMS"),
        style: ElevatedButton.styleFrom(
          primary: AppColor.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset("asset/player/Placeholder.png"),
              const Text("You haven't created a team yet!")
            ],
          ),
        )
      ),
    );
  }
}
