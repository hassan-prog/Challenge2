import 'package:challenge2/Screens/auth/login_screen.dart';
import 'package:challenge2/Screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/onboarding/onboarding_screen.dart';
import 'Screens/auth/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenge 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        RegisterScreen.routeName: (ctx) => const RegisterScreen(),
      },
    );
  }
}
