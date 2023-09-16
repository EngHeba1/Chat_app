import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base.dart';
import 'creat_account_navigator.dart';

class CreatAccountViewModel extends BaseViewModel <CreatAccountNavigator> {

  creatAccount(String emailAddress, String password ) async {
    navigator!.showLoading();
    print("HI");
    try {
      navigator!.hideDialog();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,

      );
      navigator!.hideDialog();
      navigator!.showMessage("Successful creat account ");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator!.hideDialog();
        navigator!.showMessage("The password provided is too weak ");

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator!.hideDialog();
        navigator!.showMessage("email-already-in-use ");

        print('email-already-in-use');
      }
    } catch (e) {
      print(e);
    }
  }
}