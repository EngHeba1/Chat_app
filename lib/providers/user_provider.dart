import 'package:chat_app/fire_base/fire_base_utils.dart';
import 'package:chat_app/models/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{
  MyUser? myUser;
  late User userAuth;

  UserProvider(){
    userAuth=FirebaseAuth.instance.currentUser!;
    initUser();
  }
   void initUser()async{
    if(userAuth != null){
     myUser= (await FireBaseUtills.readUserFromFireStore(userAuth.uid))!;
   }

}}