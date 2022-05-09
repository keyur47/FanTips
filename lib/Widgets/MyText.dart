import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTitle extends StatelessWidget {
  final String text;

  const MyTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
