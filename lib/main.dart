import 'package:chat_app/view/creat_account.dart';
import 'package:chat_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routName,
        routes: {
          CreatAccount.routName :(context) => CreatAccount(),
          Splash.routName : (context) =>     Splash(),


        },
      ),
    );
  }
}

