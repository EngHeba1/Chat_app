import 'package:chat_app/models/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base.dart';
import '../../fire_base/fire_base_utils.dart';
import 'creat_account_navigator.dart';

class CreatAccountViewModel extends BaseViewModel <CreatAccountNavigator> {

  creatAccount(String email, String password ,String fName ,String lName ,String userName , ) async {
    print("HI");
    navigator!.showLoading();
    try {
      navigator!.hideDialog();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(   //auth with fire store
        email: email,
        password: password,
      );
      // add user to fire store
      MyUser myUser =MyUser(
          id: credential.user?.uid??"" ,  //use uid from authintication to add in user collection
          fName: fName,
          lName: lName,
          userName: userName,
          email: email);
      // add user to fire store
      FireBaseUtills.addUserToFireStore(myUser);
      //after clic button add user it must go to home
      //go to home function
      navigator!.goToHome(myUser);
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