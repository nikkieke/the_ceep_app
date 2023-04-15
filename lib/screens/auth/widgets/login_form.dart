import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_text.dart';
import 'authwidgets.dart';
import 'button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return FormBuilder(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderTextField(
              name: 'email',
              decoration: AuthWidgets().textInputDecoration(
                  "Email Address", "Enter your email"
              ),

            ),
            SizedBox(
              height: 10.h,
            ),
            FormBuilderTextField(
              name: 'password',
              decoration: AuthWidgets().textInputDecoration(
                  "Password", "Enter your password"
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Button(
              appText: AppText(text: "Login",color: Colors.white,),
              onPress: () {

              },

            ),
          ],
        ),
      ),

    );
  }
}
