import 'package:chat_app/models/myUser.dart';
import 'package:chat_app/modules/creat_account/creat_account_view.dart';
import 'package:chat_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../base.dart';
import '../../styles/app_colors.dart';
import '../../view/wedgets/text_field.dart';
import '../home_screen/home_screen.dart';
import 'log_in_navigator.dart';
import 'log_in_view_model.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  static const String routName = "LogIn";

  @override
  State<LogInView> createState() => _LogInViewState();
}

 class _LogInViewState extends BaseView<LogInViewModel, LogInView>
  implements LogInNavigator{
  var formKey = GlobalKey<FormState>();
  var emailControler=TextEditingController();
  var passwordControler =TextEditingController();
  bool obscureTextCheck=true;
  @override
  void initState() {
    super.initState();
   viewmodel.navigator=this;
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
                  child: Text("Log In",
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
                                  color: Colors.black,
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
                        onPressed: onPressed, child: Text("Log In")),
                    SizedBox(height: 10.h,),
                    Center(child: InkWell(onTap: () =>Navigator.pushReplacementNamed(context, CreatAccount.routName) ,
                        child: Text("Don not Have an account")))

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

  @override
  LogInViewModel initViewModel() {
    return LogInViewModel();
  }

  void onPressed(){
    if(formKey.currentState!.validate()==true){
      viewmodel.logIn(emailControler.text, passwordControler.text);
    }
  }

  @override
  goToHome(MyUser myUser) {
    var provider=Provider.of<UserProvider>(context,listen: false);
    provider.myUser=myUser;
    Navigator.pushReplacementNamed(context, HomeScreen.routName);
   //go to home
  }
}
