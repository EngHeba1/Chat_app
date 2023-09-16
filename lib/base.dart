import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseView <Vm extends BaseViewModel, T extends StatefulWidget>
    extends State<T> implements BaseNavigator {
  late Vm viewmodel;

  Vm initViewModel();

  @override
  void initState() {
    super.initState();
    viewmodel = initViewModel();
  }

  @override
  void hideDialog() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String message="Loading..."}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Row(children: [CircularProgressIndicator(), Text(message)]),
        ),
      ),
    );
  }

  @override
  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => Center(
            child: Container(
              decoration: BoxDecoration(color:Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )));
  }

}

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  late T? navigator=null ;
}

abstract class BaseNavigator {
  void showLoading({String message});

  void showMessage(String message);

  void hideDialog();
}
