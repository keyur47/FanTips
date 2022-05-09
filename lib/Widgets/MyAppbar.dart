// import 'package:fantips/Screens/loginpage/loginpage.dart';
// import 'package:fantips/Util/AppColor.dart';
// import 'package:fantips/Util/AppIcon.dart';
// import 'package:fantips/Util/AppStrings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// PreferredSizeWidget MyAppbar(
//   String text1,
// ) {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(34),
//     child: AppBar(
//       automaticallyImplyLeading: false,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text1,
//             style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
//           ),
//           GestureDetector(
//             onTap: () {
//               Get.to(Login());
//             },
//             child: const Text(
//               AppString.logIn,
//               style: TextStyle(color: AppColor.green, fontSize: 15),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// PreferredSizeWidget MyAppbar1(String text1, String text2, String image) {
//   return PreferredSize(
//     preferredSize: Size.fromHeight(45),
//     child: AppBar(
//       automaticallyImplyLeading: false,
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             text1,
//             style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
//           ),
//           Expanded(flex: 2, child: Container()),
//           InkWell(
//             onTap: () {
//               Get.to(Login());
//             },
//             child: Text(
//               text2,
//               style: const TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 15,
//                   color: Color(0xFF25C06D),
//                   height: 0),
//             ),
//           ),
//           Expanded(child: Container()),
//           InkWell(
//             child: Image.asset(
//               image,
//               height: 2.4.h,
//             ),
//             onTap: () {
//               Get.toNamed('search');
//             },
//           )
//         ],
//       ),
//     ),
//   );
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   int pageindex = 0;
//
//   // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static List<Widget> _widgetOptions = <Widget>[
//     InkWell(
//       onTap: () {
//         // pageindex = 0;
//         Get.offNamed('more');
//       },
//     ),
//     InkWell(
//       onTap: () {
//         // pageindex = 0;
//         Get.offNamed('more');
//       },
//     ),
//     InkWell(
//       onTap: () {
//         // pageindex = 0;
//         Get.offNamed('more');
//       },
//     ),
//     InkWell(
//       onTap: () {
//         // pageindex = 0;
//         Get.offNamed('more');
//       },
//     ),
//     InkWell(
//       onTap: () {
//         // pageindex = 0;
//         Get.offNamed('more');
//       },
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage(AppIcon.home),
//               ),
//               label: 'Home',
//               backgroundColor: Colors.grey),
//           BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage(AppIcon.home),
//               ),
//               label: 'Home',
//               backgroundColor: Colors.grey),
//           BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage(AppIcon.home),
//               ),
//               label: 'Home',
//               backgroundColor: Colors.grey),
//           BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage(AppIcon.home),
//               ),
//               label: 'Home',
//               backgroundColor: Colors.grey),
//           BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage(AppIcon.home),
//               ),
//               label: 'Home',
//               backgroundColor: Colors.grey),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
