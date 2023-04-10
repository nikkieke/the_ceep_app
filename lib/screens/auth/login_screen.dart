import'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_ceep_app/core/app_text.dart';
import 'package:the_ceep_app/screens/auth/widgets/authwidgets.dart';
import 'package:the_ceep_app/screens/auth/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.arrow_back,
                    size: 25,
                  ),
                ),
              ],
            ),
            AuthWidgets().titleText(
            "Log-in"
            ),
            SafeArea(
                child: FormBuilder(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthWidgets().textFieldTitleText(
                            "Email Address"
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormBuilderTextField(
                          name: 'email',
                          decoration: AuthWidgets().textInputDecoration(
                              "Email Address", "Enter your email"
                          ),

                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AuthWidgets().textFieldTitleText(
                            "Password"
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
                          height: 130.h,
                        ),

                        Button(
                          appText: AppText(text: "Login",color: Colors.white,),
                          onPress: () {

                          },

                        ),
                      ],
                    ),
                  ),

                )
            ),

          ],
        ),
      ),
    );
  }
}
