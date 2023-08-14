import 'package:challenge2/Screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class buildOnboarding extends StatelessWidget {
  const buildOnboarding({
    super.key,
    required this.itemIndex,
    required this.currentIndex,
    required this.pageController,
    this.onboardingItemList,
  });

  final onboardingItemList;
  final int itemIndex;
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onboardingItemList[itemIndex]['image']!),
                opacity: 0.8,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(WelcomeScreen.routeName),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, topPadding + 10, 0, 0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF797171),
                            fontFamily: 'assets/fonts/Poppins.ttf',
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => itemIndex == 3
                          ? Navigator.of(context)
                              .pushReplacementNamed(WelcomeScreen.routeName)
                          : pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, topPadding + 10, 20, 0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF6CC51D),
                            fontFamily: 'assets/fonts/Poppins.ttf',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  onboardingItemList[itemIndex]['text']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'assets/fonts/Poppins.ttf',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000),
                    letterSpacing: 0.9.sp,
                  ),
                ),
                itemIndex == 0
                    ? Image.asset('assets/images/bigCart 1.png')
                    : Container(),
                const SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'assets/fonts/Poppins-Light.ttf',
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF868889),
                    letterSpacing: 0.45.sp,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
