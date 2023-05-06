import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_ceep_app/screens/onboarding/splashscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/custom_theme.dart';
import 'core/lightmode_notifier.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var lightMode = ref.watch(lightModeProvider);
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: customDarkTheme(),
            theme: customLightTheme(),
            themeMode: lightMode? ThemeMode.light: ThemeMode.dark,
            title: 'Flutter Demo',
            home: const SplashScreen(),
          );
        });
  }
}


