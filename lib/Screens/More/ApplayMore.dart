import 'package:fantips/Util/AppColor.dart';
import 'package:fantips/Util/AppStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Applay extends StatefulWidget {
  @override
  _ApplayState createState() => _ApplayState();
}

class _ApplayState extends State<Applay> {
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
            AppString.applyAsexperts,
            style: TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: AppColor.light,
        body: Padding(
          padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w,bottom: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: username,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  Container(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: channel,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Channel URL",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Channel URL';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  Container(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: contact,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Contact no.",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Contact no.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Lit(),
                  Container(
                    height: 6.5.h,
                    child: TextFormField(
                      controller: description,
                      autofocus: false,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(color: Colors.white)),
                      style: TextStyle(color: Colors.white),
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
                      const SnackBar(content: Text('Processing Data')),
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
//   Widget item(String name, String text, TextEditingController controller,String textname) {
//     return Container(
//       height: 6.5.h,
//       child: Padding(
//         padding: EdgeInsets.only(top: 2.h),
//         child: TextFormField(
//           decoration:  InputDecoration(
//             border: InputBorder.none,
//             hintText:  textname,
//             hintStyle: TextStyle(color: Colors.white)
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget Lit() {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 0.w,),
//       child: const Divider(
//         thickness: 2,
//         color: Color(0xFFE6E6E6),
//         height: 1,
//       ),
//     );
//   }
// }
