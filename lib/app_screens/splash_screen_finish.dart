import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fifi_flutter_project/game/game_selection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenFinish extends StatelessWidget {

  const SplashScreenFinish(
  {Key? key, required this.score}) : super(key: key);

  final int score;

  void addStar(uid) async {
    Map<String, Object?> updates = {};
    updates["UsersMoney/$uid"] = true;
    updates["UsersMoney/$uid"] = ServerValue.increment(score);
    return FirebaseDatabase.instance.ref().update(updates);
  }

  @override
  Widget build(BuildContext context) {
    addStar(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: AnimatedSplashScreen(
              splash: Lottie.asset('assets/lottie/bookworm_doggo.json'),
              nextScreen: const GameSelection(),
              splashIconSize: 400,
              duration: 10000,
              backgroundColor: Colors.white,
              splashTransition: SplashTransition.fadeTransition,
              animationDuration: const Duration(seconds: 1),
            ),
          ),
          Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Congrats, you have earned $score points",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
