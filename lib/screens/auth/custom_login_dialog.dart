import'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:the_ceep_app/screens/auth/widgets/authwidgets.dart';
import 'package:the_ceep_app/screens/auth/widgets/button.dart';
import 'package:the_ceep_app/screens/auth/widgets/login_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/lightmode_notifier.dart';

Future<Object?>customLoginDialog(BuildContext context,WidgetRef ref, {required ValueChanged onClosed}){
  var lightMode = ref.watch(lightModeProvider);

  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: 'Log-in',
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation,__,child){
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)
          ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
    child:
    Container(
      height: 420.h,
      margin:  EdgeInsets.symmetric(horizontal: 16.r),
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 32.r),
      decoration: lightMode? BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ):
      BoxDecoration(
        color: Color(0xff121212).withOpacity(0.98),
        borderRadius:  BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
            clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Column(
                  children: [
                    AuthWidgets().titleText(
                        "Log-in"
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: AppText(
                        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                            "sed do eiusmod tempor ",size: 15,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const LoginForm(),
                    const Padding(padding:  EdgeInsets.symmetric(
                    vertical: 15),
                    child:  Divider(thickness: 1.5,)),
                    Padding(padding: const EdgeInsets.symmetric(
                        vertical: 5),
                      child: AppText(text: "Log in with Apple or Google",size: 15,),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.apple,
                                size: 50,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: IconButton(
                                onPressed: (){},
                                icon: SvgPicture.asset(
                                  "assets/images/google.svg", width: 45,)
                            ),
                          ),
                          ]
                          )
                      ),
                  ],
                ),
            ),

          ],
        ),
      ),
    ),
  )

  ).then(onClosed);
}

