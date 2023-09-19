import 'package:chat_app/base.dart';
import 'package:chat_app/modules/home_screen/home_screen_navigator.dart';
import 'package:chat_app/modules/log_in_screen/log_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreenViewModel, HomeScreen>
    implements HomeScreenNavegator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel, //بديه نفس الobject
      child: Stack(
        children: [
          Image.asset(
            "assets/imeges/signUp.png",
            width: double.infinity,
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Center(
                  child: Text("Chat app",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white, fontSize: 24.sp))),
            ),
            body: ElevatedButton(child: Text("Log Out"),
              onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LogInView.routName);
            }, ),
          ),
        ],
      ),
    );
  }

  @override
  HomeScreenViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeScreenViewModel();
  }
}
