import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:heart_beat_app/helpers/constants.dart';
import 'package:heart_beat_app/widget/default_btn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

// List<MyClass> selecteditems = List();
class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xffEAE9F3), Colors.white],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              // const SizedBox(height: (10)),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [
                            0.1,
                            0.5,
                          ],
                          begin: Alignment.topCenter,
                          colors: [Color(0xffEAE9F3), Colors.white],
                        ),
                      ),
                      child: SizedBox(
                        height: Get.height * 0.7,
                        child: PageView(
                          physics: const ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            page1(),
                            page2(),
                            page3(),
                            page4(),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    32.horizontalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: DefaultBtn(
                        press: () {
                          // Get.off(() => const SignUpSelection());
                        },
                        label: 'Sign up',
                      ),
                    ),
                    16.horizontalSpace,
                    TextButton(
                        onPressed: () {
                          // Get.off(() => const SignInSelection());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: kPrimary,
                            fontSize: 14.sp,
                          ),
                        ))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 12.0.h,
      width: 12.h,
      decoration: BoxDecoration(
        color: isActive ? kPrimary : neutralN60,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

Widget page1() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 400.h,
          child: Stack(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Image.asset(
                    'assets/Images/onboarding_images/gallery_slide1.png',
                    width: Get.width,
                    fit: BoxFit.cover,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white.withOpacity(0.99)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Gap(20.h),
        SizedBox(
          width: 250,
          child: Text(
            'Discover, Create and Connect',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp, fontWeight: FontWeight.w600, color: textDark),
          ),
        ),
        Gap(16.h),
        SizedBox(
          width: 250.w,
          child: Text(
            'A community for fashion designers, enthusiasts and more.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: textDarkAsh),
          ),
        )
      ]);
}

Widget page2() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Placeholder(),
        SizedBox(
          height: 400.h,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Image.asset(
                  'assets/Images/onboarding_images/gallery_slide.png')),
        ),

        // Placeholder()
        // Image.asset('assets/Images/onboarding_images/gallery_slide.png'),
        Gap(20.h),
        SizedBox(
          width: 280,
          child: Text(
            'Are you a Fashion Designer?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp, fontWeight: FontWeight.w600, color: textDark),
          ),
        ),
        Gap(16.h),
        SizedBox(
          width: 250,
          child: Text(
            'Show off your designs and connect with potential customers.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: textDarkAsh),
          ),
        )
      ]);
}

Widget page3() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 400.h,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Image.asset(
                  'assets/Images/onboarding_images/gallery_slide (1).png')),
        ),
        Gap(20.h),
        SizedBox(
          width: 280,
          child: Text(
            'Looking for a Fashion Designer?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp, fontWeight: FontWeight.w600, color: textDark),
          ),
        ),
        Gap(16.h),
        SizedBox(
          width: 250,
          child: Text(
            'Connect with designers that will make your desired outfits.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: textDarkAsh),
          ),
        )
      ]);
}

//assets/Images/onboarding_images/gallery_slide (2).png
Widget page4() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 400.h,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Image.asset(
                  'assets/Images/onboarding_images/gallery_slide (2).png')),
        ),
        Gap(20.h),
        SizedBox(
          width: 280,
          child: Text(
            'Get Stunning Fabrics',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.sp, fontWeight: FontWeight.w600, color: textDark),
          ),
        ),
        Gap(16.h),
        SizedBox(
          width: 250,
          child: Text(
            'Shop for fabrics that will make your outfit standout Now.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: textDarkAsh),
          ),
        )
      ]);
}
