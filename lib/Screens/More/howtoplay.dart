import 'package:fantips/Util/AppStrings.dart';
import 'package:fantips/Util/Sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HowToPlay extends StatefulWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  _HowToPlayState createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.howtoplay,
          style: TextStyle(fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 3.w, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizebox.h10,
            Container(
              width: 92.w,
              color: Colors.indigo[300],
              child: const Text(
                "HTTP Status 404 – Not Found",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Text(
              "Type Status Report",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            AppSizebox.h5,
            const Text(
              "Description The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              width: 92.w,
              color: Colors.indigo[300],
              child: const Text(
                "Apache Tomcat/9.0.31 (Ubuntu)",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
