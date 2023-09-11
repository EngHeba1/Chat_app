import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  String titel;
  //int maxLine;
  String? Function(String?)?  validator;
  TextEditingController? controller=TextEditingController();
  void Function(String?)? onSaved;
  bool? obscur;
  TextFieldWidget({super.key, required this.titel,this.onSaved ,this.validator ,this.obscur,this.controller });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
       // maxLines: maxLine,
        //controller:controller ,
        obscureText: obscur??false,
        onSaved: onSaved,
        validator:validator,
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppCloros.lightColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppCloros.lightColor)),
            label: Text(
              titel,
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
