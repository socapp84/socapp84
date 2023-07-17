import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socapp1/splashAndOnboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash App',
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
      ],
    );
  }
}
