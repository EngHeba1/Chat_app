import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'connector.dart';

class CreatAccountViewModel extends ChangeNotifier{

  late Connector connector;
  creatAccount(String emailAddress, String password ) async {
    try {
      connector.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      connector.hidLoading();
      connector.showMessage("Successful creat account ");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        connector.hidLoading();
        connector.showMessage("The password provided is too weak ");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('email-already-in-use');
      }
    } catch (e) {
      print(e);
    }
  }
}