import 'package:chat_app/base.dart';
import 'package:chat_app/models/myUser.dart';

abstract class LogInNavigator extends BaseNavigator{
 goToHome(MyUser myUser);
  
}