import 'package:fantips/Screens/loginpage/GoogleLogin/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Util/GetPages.dart';

 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>  AlertDialog(
        backgroundColor: Colors.grey[800],
        // title:  Text('Are you sure?'),
        content:  const Text('Are you sure want to exit?',style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:  const Text('NO',style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child:  const Text('YES',style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    )) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: WillPopScope(
            onWillPop: _onWillPop,
          child: GetMaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: Colors.black
              ),
              textTheme: const TextTheme(
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Circular'
                ),
              ),
              backgroundColor: const Color(0xff1B1B1B),
              scaffoldBackgroundColor: Colors.black,
            ),
            debugShowCheckedModeBanner: false,
            title: 'FanTips',
            getPages: Routes.routes,
            initialRoute: 'screen1',
          ),
        ),
      );
    });
  }
}
