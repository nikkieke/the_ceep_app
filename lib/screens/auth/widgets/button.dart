import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_text.dart';

class Button extends StatelessWidget{
  final AppText appText;
  final VoidCallback onPress;

  const Button({Key? key, required this.appText,required this.onPress,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(30.w, 20.h),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),

      onPressed: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5).w,
          color:Color(0xff73009E),
        ),
        child: appText,
      ),
    );


  }
}