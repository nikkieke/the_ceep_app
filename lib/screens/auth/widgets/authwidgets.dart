import 'package:flutter/material.dart';

import '../../../core/app_text.dart';

class AuthWidgets{
  InputDecoration textInputDecoration([String labelText="", String hintText = "", Widget? suffixIcon,]){
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color:Colors.black26),
      hintText: hintText,
      fillColor: Colors.white30,
      filled: true,
      contentPadding: const EdgeInsets.all(8),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  AppText titleText([String title = ""]){
    return AppText(
        text: title,
        fontWeight: FontWeight.w700,
        size: 20,
    );
  }

  AppText textFieldTitleText([String title = ""]){
    return AppText(
      text: title,
      fontWeight: FontWeight.w400,
      size: 16,
    );
  }
}