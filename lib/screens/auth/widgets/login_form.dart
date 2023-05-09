import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../../core/app_text.dart';
import '../../../core/lightmode_notifier.dart';
import '../../../core/utils/rive_utils.dart';
import '../../home/widgets/entry_point.dart';
import 'authwidgets.dart';
import 'button.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool isShowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;



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
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return const EntryPoint();
                  }));
            });
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
    var lightMode = ref.watch(lightModeProvider);
    return Stack(
      children: [
        FormBuilder(
          key: formKey,
          child: Container(
            margin: EdgeInsets.only(left: 20.r, right: 20.r, top: 20.r,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email){},
                  decoration: AuthWidgets().textInputDecoration(
                      "Email Address", "Enter your email",
                      lightMode? const TextStyle(color: Colors.black26) :
                      const TextStyle(color: Colors.white70)
                  ),

                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "";
                    }
                    return null;
                  },
                  obscureText: true,
                  onSaved: (password){},
                  decoration: AuthWidgets().textInputDecoration(
                      "Password", "Enter your password",
                      lightMode? const TextStyle(color: Colors.black26) :
                  const TextStyle(color: Colors.white70)
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
                RiveUtils.getRiveController(artboard);
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

