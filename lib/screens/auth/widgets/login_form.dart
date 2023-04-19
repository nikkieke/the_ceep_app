import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/app_text.dart';
import 'authwidgets.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormBuilderState>();

  bool isShowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  StateMachineController getRiveController(Artboard artboard){
    StateMachineController? controller =
    StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller;
  }

  void login(BuildContext context){
    setState(() {
      isShowLoading = true;
    });
    Future.delayed(const Duration(seconds: 1),
        (){
          if (formKey.currentState!.validate()){
            // if everything is okay, show check animation
            check.fire();
            Future.delayed(const Duration(seconds: 2),
              (){
              setState(() {
                isShowLoading = false;
              });
            }
            );
          }
          else{
            //on error show error animation
            error.fire();
            Future.delayed(
              const Duration( seconds: 2),
                (){
                  setState(() {
                    isShowLoading = false;
                  });
                }
            );
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FormBuilder(
          key: formKey,
          child: Container(
            margin: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilderTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email){},
                  name: 'email',
                  decoration: AuthWidgets().textInputDecoration(
                      "Email Address", "Enter your email"
                  ),

                ),
                SizedBox(
                  height: 10.h,
                ),
                FormBuilderTextField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  obscureText: true,
                  onSaved: (password){},
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
                    login(context);
                  },

                ),
              ],
            ),
          ),
        ),
        isShowLoading?
        CustomPositioned(
          child: RiveAnimation.asset("assets/RiveAssets/check.riv",
            onInit: (artboard){
            StateMachineController controller =
                getRiveController(artboard);
            check = controller.findSMI('Check') as SMITrigger;
            error = controller.findSMI('Error') as SMITrigger;
            reset = controller.findSMI('Reset') as SMITrigger;
            },
          ),
        )
            : const SizedBox()
      ]
    );
  }
}

class CustomPositioned extends StatelessWidget{
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context){
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(flex:2)
        ],
      )
    );
  }
}

