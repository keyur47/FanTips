import "package:get/state_manager.dart";
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class CompletedSquad extends StatelessWidget {
  const CompletedSquad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset("asset/player/Placeholder.png"),
              const Text("Team squads to be added soon!")
            ],
          ),
        )
    );
  }
}
