import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fifi_flutter_project/screens/adoption_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/lottie/puppy_sleeping.json'),
      nextScreen: MyHomePage(title: 'title'),
      splashIconSize: 250,
      duration: 3000,
      backgroundColor: Colors.brown,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }

}
