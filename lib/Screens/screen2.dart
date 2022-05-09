import 'package:fantips/Screens/Home/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  final PageController _pageController = PageController();

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

    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
          // Get.to(HomeMain());
        },
        onBoardData: onBoardData,
        imageHeight: 200,
        imageWidth: 310,
        titleStyles: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        descriptionStyles: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.grey,
          activeColor: Colors.green,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),

        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: Container(),

        // TextButton(
        //   onPressed: () {
        //     // print('skipButton pressed');
        //   },
        //   child: const Text(
        //     "",
        //     style: TextStyle(color: Colors.deepOrangeAccent),
        //   ),
        // ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return Padding(
              padding: EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 450,
                  height: 50,
                  color: Colors.green,
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(30),
                  //   gradient: const LinearGradient(
                  //     colors: [Colors.redAccent, Colors.deepOrangeAccent],
                  //   ),
                  // ),
                  child: state.isLastPage
                      ? InkWell(
                       onTap: (){
                         Get.to(HomeMain());
                       },
                         child: const Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      )
                      : const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                  // Text(
                  //   state.isLastPage ? "Done" : "Next",
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "One Stop Solution",
    description: "No need to spend hours of viewing and reading fantasy videos and blogs.",
    imgUrl: "asset/Images/stop2.png",
  ),
  const OnBoardModel(
    title: "Detailed Analysis",
    description:
        "Team prediction and player selection made easy by powerful analysis",
    imgUrl: 'asset/Images/stop1.png',
  ),
  const OnBoardModel(
      title: "Make Winning, A Habit",
      description:
          "Take control over your fantasy team and get a habit of winning everyday",
      imgUrl: "asset/Images/stop4.png"),
];
