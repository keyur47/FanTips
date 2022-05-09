import 'package:fantips/Screens/Experts/Experts.dart';
import 'package:fantips/Screens/Experts/Search/search.dart';
import 'package:fantips/Screens/Home/Home.dart';
import 'package:fantips/Screens/IPL/Ipl.dart';
import 'package:fantips/Screens/Matches/Completed/CompletedMatches/CompletedMatches.dart';
import 'package:fantips/Screens/Matches/Matches.dart';
import 'package:fantips/Screens/Matches/U%20L%20C%20Matches/UpcomingMatches.dart';
import 'package:fantips/Screens/More/More.dart';
import 'package:get/get.dart';

import '../Screens/screen1.dart';

class Routes {
  static final routes = [
    GetPage(name: '/screen1', page: () => Screen1(), transition: Transition.leftToRight),
    GetPage(name: '/home', page: () => Home(), transition: Transition.leftToRight),
    // GetPage(name: '/news', page: () => HomeNews(newimage: "", newname: "",),transition: Transition.downToUp),
    GetPage(name: '/matches', page: () => const Matches_Screen(), transition: Transition.leftToRight),
    GetPage(name: '/ipl', page: () => const Ipl(), transition: Transition.leftToRight),
    GetPage(name: '/expert', page: () => const Experts(), transition: Transition.leftToRight),
    GetPage(name: '/more', page: () => const More(), transition: Transition.leftToRight),
    GetPage(name: '/search', page: () => const Search(), transition: Transition.leftToRight),
    // GetPage(name: '/expertinfo', page: () => const ExpertInfo(),transition: Transition.leftToRight),
    GetPage(name: '/upcomingmatches', page: () => const UpcomingMatches(), transition: Transition.leftToRight),
    GetPage(name: '/completedMatches', page: () => const CompletedMatches(), transition: Transition.leftToRight),
  ];
}
