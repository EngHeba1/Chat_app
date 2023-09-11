import 'package:chat_app/view/wedgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/app_colors.dart';

class CreatAccount extends StatefulWidget {
  const CreatAccount({super.key});

  static const String routName = "CreatAccount";

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  var formKey = GlobalKey<FormState>();
  var emailControler=TextEditingController();
  var passwordControler=TextEditingController();
  bool obscureTextCheck = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                  titel: 'First Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Please Enter First Name";
                    }
                  },
                ),
                TextFieldWidget(
                    titel: 'Last Name',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Please Enter Last Name";
                      }
                    }),
                TextFieldWidget(
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
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if(!emailValid){
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
                      }
                      else if (password.length<6 ){
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
                          ,style:
                        //pro.language == "en"?
                               GoogleFonts.novaSquare(
                            color: AppCloros.lightColor,
                          )
                              //: GoogleFonts.cairo(
                            //color: AppCloros.lightColor,
                          ),

                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppCloros.lightColor),
                        ),
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                        suffix:
                        InkWell(
                            onTap: () {
                              setState(() {
                                obscureTextCheck = !obscureTextCheck;
                              });
                            },
                            child:
                            obscureTextCheck
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
                    onPressed: onPressed, child: Text("Creat Account"))
              ],
            ),
          ),
        ),
      )
    ]);
  }

  onPressed() async {    //creat user
    if(formKey.currentState!.validate()){
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControler.text,
        password: passwordControler.text,
      );

    }
  }
}
