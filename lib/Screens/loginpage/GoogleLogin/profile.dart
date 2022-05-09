import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Widgets/MyContainer.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key}) : super(key: key);

  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 3.w),
        child: Stack(
          children: [
            ProfileAppbar(
              text: "Profile",
              logout: 'Logout',
              icon: (Icons.arrow_back),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.h, left: 4.w, right: 3.w),
              child: Column(
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.network(
                        user?.photoURL ?? "",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.green,
                          ));
                        },
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: ClipOval(
                            child: Image.asset(
                              "asset/Images/profileimages.png",
                              width: 110,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 7.h,
                      left: 2.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.portrait_rounded,
                              color: AppColor.greymin,
                              size: 40,
                            ),
                            AppSizebox.w10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 18, color: AppColor.greymin),
                                ),
                                AppSizebox.h5,
                                Text(user?.displayName ?? "",
                                    style: const TextStyle(
                                        fontSize: 18, color: AppColor.greymin)),
                              ],
                            ),
                          ],
                        ),
                        AppSizebox.h10,
                        const Divider(color: Colors.white),
                        AppSizebox.h10,
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: AppColor.greymin,
                              size: 40,
                            ),
                            AppSizebox.w10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email",
                                    style: TextStyle(
                                        fontSize: 18, color: AppColor.greymin)),
                                AppSizebox.h5,
                                Text(user?.email ?? "",
                                    style: TextStyle(
                                        fontSize: 18, color: AppColor.greymin)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
