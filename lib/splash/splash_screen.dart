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
        decoration: const BoxDecoration(color: Colors.white),
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
