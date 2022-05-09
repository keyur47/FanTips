import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Util/AppColor.dart';

class ContactMore extends StatefulWidget {
  const ContactMore({Key? key}) : super(key: key);

  @override
  _ContactMoreState createState() => _ContactMoreState();
}

class _ContactMoreState extends State<ContactMore> {
  TextEditingController username = TextEditingController();
  TextEditingController channel = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController description = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.contactUsforbranding,
            style: TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: AppColor.light,
        body: Padding(
          padding:
              EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: username,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  SizedBox(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: channel,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email / Mobile number",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email / Mobile number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  SizedBox(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: contact,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Application link",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Application link';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  SizedBox(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: description,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Thanks you'),
                        action: SnackBarAction(
                          label: '',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    height: 5.h,
                    width: 70.w,
                    padding: EdgeInsets.only(top: 1.2.h),
                    child: const Text(
                      "SUBMIT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Lit() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 4.w,
      ),
      child: const Divider(
        thickness: 2,
        color: Color(0xFFE6E6E6),
        height: 1,
      ),
    );
  }
}
