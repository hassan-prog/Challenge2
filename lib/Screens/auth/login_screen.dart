import 'package:challenge2/Screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import 'widgets/build_button.dart';
import 'widgets/build_input_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Align(
            widthFactor: 1.5,
            heightFactor: 1.5,
            child: SvgPicture.asset(
              'assets/icons/backArrow.svg',
            ),
          ),
        ),
        title: Text(
          'Login',
          style: textStyle('assets/fonts/Poppins.ttf', 18.sp, FontWeight.w500,
              0.54.sp, Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Image.asset('assets/images/lady2.png'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
                height: mediaQuery.size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F5F9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back !',
                      style: textStyle('assets/fonts/Poppins.ttf', 25.sp,
                          FontWeight.w500, 0.75.sp, const Color(0xFF000000)),
                    ),
                    Text(
                      'Sign in to your account',
                      style: textStyle(
                        'assets/fonts/Poppins.ttf',
                        15.sp,
                        FontWeight.w300,
                        0.45.sp,
                        const Color(0xFF868889),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          buildInputField(
                            'assets/icons/mail.svg',
                            'Email address',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              } else if (value.contains(r'\w+@\w+.\w+')) {
                                return 'Invalid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 6),
                          buildInputField(
                            'assets/icons/lock.svg',
                            '* * * * * * * *',
                            suffixIcon: 'assets/icons/eye.svg',
                            obsecure: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot password',
                            style: textStyle(
                              'assets/fonts/Poppins.ttf',
                              15.sp,
                              FontWeight.w400,
                              0.45.sp,
                              const Color(0xFF407EC7),
                            ),
                          )),
                    ),
                    buildButton('Login',
                        onPressed: () => formKey.currentState!.validate()),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ? ',
                          style: TextStyle(
                            color: const Color(0xFF868889),
                            letterSpacing: 0.45.sp,
                            fontSize: 15.sp,
                            fontFamily: 'assets/fonts/Poppins.ttf',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 0.45.sp,
                              fontSize: 15.sp,
                              fontFamily: 'assets/fonts/Poppins.ttf',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
