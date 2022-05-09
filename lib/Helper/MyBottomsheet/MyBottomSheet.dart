import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppIcon.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 3.w,right: 3.w),
        child: Column(
          children: [
            AppSizebox.h15,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcon.sortby,height: 1.5.h,),
                AppSizebox.w5,
                const Text(
                  AppString.sortBy,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                ),
              ],
            ),
            AppSizebox.h10,
            Divider(height: 1,color: Colors.grey.shade700,),
            SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.predictions,style: TextStyle(color: AppColor.white),),trailing: const Icon(Icons.check_circle,color: AppColor.white,),),),
            Divider(height: 1,color: Colors.grey.shade700,),
            SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.avgScore,style: TextStyle(color: AppColor.white),),trailing: const Icon(Icons.check_circle,color: AppColor.white),),),
            Divider(height: 1,color: Colors.grey.shade700,),
            SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.wins,style: TextStyle(color: AppColor.white),),trailing: Icon(Icons.check_circle,color: AppColor.white),),),
          ],
        ),
      ),
    );
  }
}

// class LoginBottomSheet extends StatelessWidget {
//   const LoginBottomSheet ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 29.h,
//       child: Padding(
//         padding: EdgeInsets.only(left: 3.w,right: 3.w),
//         child: Column(
//           children: [
//             AppSizebox.h15,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(AppIcon.sortby,height: 1.5.h,),
//                 AppSizebox.w5,
//                 const Text(
//                   AppString.sortBy,
//                   style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             AppSizebox.h10,
//             Divider(height: 1,color: Colors.grey.shade700,),
//             SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.predictions,style: TextStyle(color: AppColor.white),),trailing: const Icon(Icons.check_circle,color: AppColor.white,),),),
//             Divider(height: 1,color: Colors.grey.shade700,),
//             SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.avgScore,style: TextStyle(color: AppColor.white),),trailing: const Icon(Icons.check_circle,color: AppColor.white),),),
//             Divider(height: 1,color: Colors.grey.shade700,),
//             SizedBox(height: 7.h, child: ListTile(onTap: (){},title: const Text(AppString.wins,style: TextStyle(color: AppColor.white),),trailing: Icon(Icons.check_circle,color: AppColor.white),),),
//           ],
//         ),
//       ),
//     );
//   }
// }