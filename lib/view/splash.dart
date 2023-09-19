import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_app/modules/creat_account/creat_account_view.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routName = "Splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),
            ()=> Navigator.pushReplacementNamed(context, CreatAccount.routName) );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.4),
          Center(child: Image.asset("assets/imeges/logo.png")),
          Spacer(),
          Text("Introduced By Eng Heba Bahrawy",style:GoogleFonts.poppins() ,),
          SizedBox(height: 20.h,)
        ],
      ),);
  }
}
