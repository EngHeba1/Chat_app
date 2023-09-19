import 'package:chat_app/models/myUser.dart';
import 'package:chat_app/modules/creat_account/creat_account_navigator.dart';
import 'package:chat_app/modules/log_in_screen/log_in_view.dart';
import 'package:chat_app/view/wedgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base.dart';
import '../../providers/user_provider.dart';
import '../../styles/app_colors.dart';
import '../home_screen/home_screen.dart';
import 'creat_account_view_model.dart';
import 'package:provider/provider.dart';

class CreatAccount extends StatefulWidget {
  const CreatAccount({super.key});

  static const String routName = "CreatAccount";

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends BaseView<CreatAccountViewModel,CreatAccount> implements CreatAccountNavigator {
  var formKey = GlobalKey<FormState>();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var fNameControler = TextEditingController();
  var lNameControler = TextEditingController();
  var userName = TextEditingController();
  bool obscureTextCheck = true;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.navigator=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel, //بديه نفس الobject
      child: Stack(children: [
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
                child: Text("Creat Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white, fontSize: 24.sp))),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  TextFieldWidget(
                    controller: fNameControler,
                    titel: 'First Name',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Please Enter First Name";
                      }
                    },
                  ),
                  TextFieldWidget(
                    controller: lNameControler,
                      titel: 'Last Name',
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please Enter Last Name";
                        }
                      }),
                  TextFieldWidget(
                    controller: userName,
                      titel: 'User Name',
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please Enter User Name";
                        }
                      }),
                  TextFieldWidget(
                      titel: 'Email',
                      controller: emailControler,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please Enter Email address";
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);
                        if (!emailValid) {
                          return "Pleae Enter valid Password";
                        }
                      }),
                  //
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordControler,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return
                              //pro.language == "en"?
                              "Enter Password";
                          // : "أدخل كلمة المرور";
                        } else if (password.length < 6) {
                          return
                              //pro.language == "en"?
                              "At leats 6 character";
                          // : "يجب ألا يقل عن 6 أحرف";
                        }
                        return null;
                      },
                      obscureText: obscureTextCheck,
                      decoration: InputDecoration(
                          label: Text(
                              // pro.language == "en"?
                              "Password"
                              // : "كلمة المرور",
                              ,
                              style:
                                  //pro.language == "en"?
                                  GoogleFonts.novaSquare(
                                color: AppCloros.lightColor,
                              )
                              //: GoogleFonts.cairo(
                              //color: AppCloros.lightColor,
                              ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: AppCloros.lightColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: AppCloros.lightColor)),

                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  obscureTextCheck = !obscureTextCheck;
                                });
                              },
                              child: obscureTextCheck
                                  ? const Icon(
                                      Icons.visibility,
                                      color: AppCloros.lightColor,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: AppCloros.lightColor,
                                    ))),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: onPressed, child: Text("Creat Account")),
                  SizedBox(height: 10.h,),
                  Center(child: InkWell(onTap: () =>Navigator.pushReplacementNamed(context, LogInView.routName) ,
                      child: Text("I Have an account")))
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  onPressed() async {
    //creat user
    if (formKey.currentState!.validate()) {
      viewmodel.creatAccount(
          emailControler.text, passwordControler.text,fNameControler.text,lNameControler.text,userName.text);
    }
  }

  @override
  CreatAccountViewModel initViewModel() {
    // TODO: implement initViewModel
   return CreatAccountViewModel();
  }

  @override
  goToHome(MyUser myUser) {
    var provider=Provider.of<UserProvider>(context,listen: false);
    provider.myUser=myUser;
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
  }
}
