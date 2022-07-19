import 'package:fifi_flutter_project/app_screens/splash_screen_game.dart';
import 'package:flutter/material.dart';

class GameMainPage extends StatelessWidget {
  const GameMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              AspectRatio(
                  aspectRatio: 1,
                  child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: [
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "D",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "O",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "G",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "I",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "S",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "L",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "O",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "V",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                        Container(color: Colors.teal[100],
                            child: const Center(
                                child: Text(
                                    "E",
                                    style: TextStyle(
                                      fontSize: 35,
                                    )
                                )
                            )
                        ),
                      ]
                  )
              ),
              const SizedBox(
                height: 50,
              ),
              Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                      iconSize: 50.0,
                      color: Colors.white,
                      icon: const Icon(Icons.play_arrow),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreenGame()));
                      }
                  )
              )
            ]
        )
    );
  }
}