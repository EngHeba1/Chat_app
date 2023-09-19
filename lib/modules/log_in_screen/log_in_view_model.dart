import 'package:chat_app/fire_base/fire_base_utils.dart';
import 'package:chat_app/models/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../base.dart';
import 'log_in_navigator.dart';

class LogInViewModel extends BaseViewModel<LogInNavigator>{
  logIn (String emailAddress, String password ) async {
    print("HI");
    navigator!.showLoading();
    try {
      navigator!.hideDialog();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
     MyUser? myUser=await FireBaseUtills.readUserFromFireStore(credential.user?.uid??"");
     if(myUser != null){
       navigator!.goToHome(myUser);
     }
     else{

       navigator!.showMessage("User not found in data base ");
     }
      navigator!.hideDialog();
      navigator!.showMessage("Successful creat account ");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigator!.hideDialog();
        navigator!.showMessage("No user found for that email. ");

        //print('The password provided is too weak.');
      }
      else if (e.code == 'wrong-password'){
        navigator!.hideDialog();
        navigator!.showMessage("wrong-password ");

        print('email-already-in-use');
      }
    } catch (e) {
      print(e);
    }
  }
}