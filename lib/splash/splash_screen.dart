import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beat_app/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(3.seconds, () => Get.offAll(() => const OnboardingScreen()));
  }

  //390 844

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white

            //   gradient: LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            // transform: GradientRotation(2.5),
            // stops: [
            //   0.1,
            //   0.5,
            //   0.9,
            // ],
            // colors: [
            //   kPrimary,
            //   kPrimaryLight,
            //   kPrimary,
            // ],
            // )
            ),
        child: Center(
            child: Image.asset(
          'assets/logo-plain.png',
          height: 300,
          width: 300,
        )),
      ),
    );
  }
}
