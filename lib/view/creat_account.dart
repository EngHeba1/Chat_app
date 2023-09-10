import 'package:chat_app/view/wedgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatAccount extends StatefulWidget {
  const CreatAccount({super.key});

  static const String routName = "CreatAccount";

  @override
  State<CreatAccount> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatAccount> {
  var formKey = GlobalKey<FormState>();

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
                TextFieldWidget(
                    titel: 'Password',
                    obscur: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Please Enter Pasward";
                      }
                    }),
                ElevatedButton(
                    onPressed: onPressed, child: Text("Creat Account"))
              ],
            ),
          ),
        ),
      )
    ]);
  }

  onPressed() {
    if(formKey.currentState!.validate()){
    print("hello");

    }
  }
}
