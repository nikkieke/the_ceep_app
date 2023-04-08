import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget{
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  final String text;
  TextOverflow? overflow;
  double size;

  AppText({Key? key, this.color,this.fontWeight, required this.text,this.overflow, this.textAlign,
    this.size= 0,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
              fontFamily: "Open Sans",
              fontStyle: FontStyle.normal,
              color: color,
              fontWeight: fontWeight,
              fontSize:size==0? 20 :size,
              overflow: overflow,
              decoration: TextDecoration.none
      ),
    );
  }
}