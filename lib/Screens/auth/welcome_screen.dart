import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/build_button.dart';

import 'login_screen.dart';
import 'register_screen.dart';
import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: GestureDetector(
          child: Align(
            widthFactor: 1.5,
            heightFactor: 1.5,
            child: SvgPicture.asset(
              'assets/icons/backArrow.svg',
            ),
          ),
        ),
        title: Text(
          'Welcome',
          style: textStyle('assets/fonts/Poppins-Regular.ttf', 18.sp,
              FontWeight.w500, 0.54.sp, Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/lady1.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 31, 0, 0),
              height: mediaQuery.size.height * 0.4,
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
                    'Welcome',
                    style: textStyle('assets/fonts/Poppins-Medium.ttf', 25.sp,
                        FontWeight.w500, 0.75.sp, const Color(0xFF000000)),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                    style: textStyle(
                      'assets/fonts/Poppins-Light.ttf',
                      15.sp,
                      FontWeight.w300,
                      0.45.sp,
                      const Color(0xFF868889),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0.6,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 26,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/google.svg',
                          ),
                          const Spacer(),
                          Text(
                            'Continue with google',
                            style: textStyle(
                                'assets/fonts/Poppins-Medium.ttf',
                                15.sp,
                                FontWeight.w500,
                                0,
                                const Color(0xFF000000)),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  buildButton(
                    'Create an account',
                    iconPath: 'assets/icons/person.svg',
                    onPressed: () => Navigator.of(context)
                        .pushNamed(RegisterScreen.routeName),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
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
                            .pushNamed(LoginScreen.routeName),
                        child: Text(
                          'Login',
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
    );
  }
}
