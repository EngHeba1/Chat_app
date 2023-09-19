import 'package:chat_app/modules/creat_account/creat_account_view.dart';
import 'package:chat_app/modules/home_screen/home_screen.dart';
import 'package:chat_app/providers/user_provider.dart';
import 'package:chat_app/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'modules/log_in_screen/log_in_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const ChatApp()));
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<UserProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: provider.userAuth==null?Splash.routName:HomeScreen.routName,
        routes: {
          Splash.routName : (context)   =>     Splash(),
          CreatAccount.routName :(context) => CreatAccount(),
          LogInView.routName :(context)  => LogInView(),
          HomeScreen.routName :(context) => HomeScreen(),


        },
      ),
    );
  }
}

