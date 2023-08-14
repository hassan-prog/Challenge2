import 'package:flutter/material.dart';

import 'widgets/build_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
// items of each onboarding screen
final onboardingItemList = [
  {
    'text': 'Welcome to',
    'image': 'assets/images/splash-image1.png',
  },
  {
    'text': 'Buy Quality\nDairy Products',
    'image': 'assets/images/splash-image2.png',
  },
  {
    'text': 'Buy Premium\nQuality Fruits',
    'image': 'assets/images/splash-image3.png',
  },
  {
    'text': 'Get Discounts\nOn All Products',
    'image': 'assets/images/splash-image4.png',
  },
];

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return buildOnboarding(
                      itemIndex: i,
                      onboardingItemList: onboardingItemList,
                      currentIndex: currentIndex,
                      pageController: pageController,
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => buildDot(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 6,
      width: 6,
      margin: const EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? const Color(0xFF6CC51D) : Colors.grey,
      ),
    );
  }
}
