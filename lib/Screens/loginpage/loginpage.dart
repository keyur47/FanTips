// import 'package:fantips/Screens/Home/Home.dart';
// import 'package:fantips/Screens/loginpage/GoogleLogin/profile.dart';
// import 'package:fantips/Util/AppColor.dart';
// import 'package:fantips/Util/Sizebox.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../Model/Matches_Model/Searchmodel.dart';
// import 'GoogleLogin/services.dart';
//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool isLoading = false;
//   final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 8.w, top: 2.h),
//           child: GestureDetector(
//             child: Icon(
//               Icons.close,
//               color: Colors.white,
//               size: 4.h,
//             ),
//             onTap: () {
//               Get.back();
//             },
//           ),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 15.h),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     height: 116,
//                     width: 116,
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(30),
//                       //border: Border.all(width: 2,color: Colors.green),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 0.8.w, top: 0.4.h),
//                     child: Container(
//                       height: 110,
//                       width: 110,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 3, color: Colors.white),
//                           borderRadius: BorderRadius.circular(30),
//                           image: const DecorationImage(
//                               image: AssetImage(
//                                   "asset/Images/fantips_logo_12png.png"))),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 5.h),
//                 child: Row(
//                   children: [
//                     Expanded(child: Divider(color: Colors.grey.shade700)),
//                     AppSizebox.w10,
//                     const Text(
//                       "LET'S CONNECT",
//                       style: TextStyle(color: AppColor.greymin),
//                     ),
//                     AppSizebox.w10,
//                     Expanded(
//                       child: Divider(color: Colors.grey.shade700),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//
//               GestureDetector(
//                 onTap: () {
//                   // setState(() {
//                   //   isLoading = true;
//                   // });
//                   print('sing------------');
//                   //
//                   // Auth.signInWithGoogle(
//                   //   password: '',
//                   //   email: '',
//                   // ).then((value) => {
//                   //       Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(builder: (context) => (HomeMain())),
//                   //       )
//                   //     });
//
//                   final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
//                   //provider.googleLogin().whenComplete(() => )
//
//                   // then((value) {
//                   //   Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(builder: (context) => (ProfileData())),
//                   //   );
//                   // }
//                   //);
//                 },
//                 child: isLoading
//                     ? Center(
//                         child: SizedBox(
//                           height: 3.h,
//                           width: 4.w,
//                           child: const LoadingIndicator(
//                               indicatorType: Indicator.lineSpinFadeLoader,
//                               colors: [Colors.white],
//                               strokeWidth: 1,
//                               backgroundColor: Colors.black,
//                               pathBackgroundColor: Colors.black),
//                         ),
//                       )
//                     : Container(
//                         height: 7.h,
//                         width: 75.w,
//                         decoration: BoxDecoration(
//                             color: Colors.white12,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Row(
//                           children: const [
//                             AppSizebox.w20,
//                             CircleAvatar(
//                               radius: 15,
//                               backgroundColor: Colors.transparent,
//                               backgroundImage:
//                                   AssetImage("asset/Images/google-logo.png"),
//                             ),
//                             AppSizebox.w15,
//                             Text(
//                               "Sign in with Google",
//                               style: TextStyle(
//                                   color: AppColor.greymin, fontSize: 13),
//                             )
//                           ],
//                         ),
//                       ),
//               ),
//               SizedBox(
//                 height: 5.h,
//               ),
//               Container(
//                 height: 7.h,
//                 width: 75.w,
//                 decoration: BoxDecoration(
//                     color: Colors.white12,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Row(
//                   children: const [
//                     AppSizebox.w20,
//                     CircleAvatar(
//                       radius: 15,
//                       backgroundImage:
//                           AssetImage("asset/Images/facebook_logo.png"),
//                     ),
//                     AppSizebox.w15,
//                     Text(
//                       "Sign in with Facebook",
//                       style: TextStyle(color: AppColor.greymin, fontSize: 13),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
