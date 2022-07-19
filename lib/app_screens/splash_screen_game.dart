import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fifi_flutter_project/game/game_selection.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenGame extends StatelessWidget {
  const SplashScreenGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Lottie.asset('assets/lottie/bookworm_doggo.json'),
        nextScreen: const GameSelection(),
        splashIconSize: 400,
        duration: 3000,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }

}
