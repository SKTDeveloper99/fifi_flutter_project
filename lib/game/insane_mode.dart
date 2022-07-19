import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'confetti.dart';

class InsaneMode extends StatefulWidget {
  const InsaneMode({Key? key}) : super(key: key);

  @override
  _InsaneModeState createState() => _InsaneModeState();
}

class _InsaneModeState extends State<InsaneMode> {
  var grid = List.filled(9, 0);
  var player = true;
  var game = true;
  var dots = ".";
  @override
  Widget build(BuildContext context) {
    addPoints(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Big Brain Mode"),
      ),
      body: Stack(
          children: [
        Column(children: [
          AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: [
                  for (var i = 0; i < 9; i++)
                    Container(
                        color: Colors.teal[100],
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isWinning(1, grid) || isWinning(2, grid)) {
                                game = false;
                              }
                              if (game) {
                                if (grid[i] != 1 && grid[i] != 2 && player) {
                                  grid[i] = 1;
                                  player = false;
                                  if (!isWinning(1, grid) &&
                                      !isWinning(2, grid)) {
                                    runAi();
                                  }
                                }
                                checkWin(1);
                              }
                            });
                          },
                          child: Center(
                              child: Text(
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold,
                                  ),
                                  grid[i] == 0
                                      ? ''
                                      : grid[i] == 1
                                      ? 'X'
                                      : grid[i] == 2
                                      ? 'O'
                                      : '')
                          ),
                        )
                    )
                ],
              )
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  tie()
                      ? 'You Tied!'
                      : isWinning(1, grid)
                      ? 'You Win!'
                      : isWinning(2, grid)
                      ? 'You Lose!'
                      : player
                      ? 'Your Turn'
                      : !player
                      ? "AI's Turn"
                      : '',
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      grid = List.filled(9, 0);
                      game = true;
                      player = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  icon: const Text(
                    'Restart',
                    style: TextStyle(fontSize: 35),
                  ),
                  label: const Icon(Icons.refresh, size: 35),
                ),
              ]),
        ]),
        SizedBox.expand(
          child: Visibility(
            visible: isWinning(1, grid),
            child: IgnorePointer(
              child: Confetti(
                isStopped: !isWinning(1, grid),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void checkWin(player) async{
    if (grid[0] == player && grid[1] == player && grid[2] == player) {
      for (var i = 3; i < 9; i++) {
        grid[i] = 0;
      }
    } else if (grid[3] == player && grid[4] == player && grid[5] == player) {
      for (var i = 0; i < 9; i++) {
        if (i >= 3 && i <= 5) {
          continue;
        }
        grid[i] = 0;
      }
    } else if (grid[6] == player && grid[7] == player && grid[8] == player) {
      for (var i = 0; i < 6; i++) {
        grid[i] = 0;
      }
    } else if (grid[0] == player && grid[4] == player && grid[8] == player) {
      for (var i = 1; i < 8; i++) {
        if (i == 4) {
          continue;
        }
        grid[i] = 0;
      }
    } else if (grid[2] == player && grid[4] == player && grid[6] == player) {
      for (var i = 0; i < 9; i++) {
        if (i == 2 || i == 4 || i == 6) {
          continue;
        }
        grid[i] = 0;
      }
    } else if (grid[0] == player && grid[3] == player && grid[6] == player) {
      for (var i = 1; i < 9; i++) {
        if (i == 3 || i == 6) {
          continue;
        }
        grid[i] = 0;
      }
    } else if (grid[1] == player && grid[4] == player && grid[7] == player) {
      for (var i = 0; i < 9; i++) {
        if (i == 1 || i == 4 || i == 7) {
          continue;
        }
        grid[i] = 0;
      }
    } else if (grid[2] == player && grid[5] == player && grid[8] == player) {
      for (var i = 0; i < 9; i++) {
        if (i == 2 || i == 5 || i == 8) {
          continue;
        }
        grid[i] = 0;
      }
    }
  }

  void addPoints(uid) async {
    if(isWinning(1, grid)) {
      Map<String, Object?> updates = {};
      updates["UsersMoney/$uid"] = true;
      updates["UsersMoney/$uid"] = ServerValue.increment(150);
      return FirebaseDatabase.instance.ref().update(updates);
    }
    if(tie()) {
      Map<String, Object?> updates = {};
      updates["UsersMoney/$uid"] = true;
      updates["UsersMoney/$uid"] = ServerValue.increment(100);
      return FirebaseDatabase.instance.ref().update(updates);
    }
  }

  void runAi() async {
    Random random = Random();
    await Future.delayed(Duration(milliseconds: random.nextInt(500)+300));

    int? winning;
    int? block;
    int? normal;
    var openSpace = [];

    for (var i = 0; i < 9; i++) {
      var value = grid[i];

      if (value > 0) {
        continue;
      }

      var future = [...grid]..[i] = 2;
      if (isWinning(2, future)) {
        winning = i;
      }

      future[i] = 1;
      if (isWinning(1, future)) {
        block = i;
      }

      openSpace.add(i);
    }

    if (grid[4] == 0) {
      normal = 4;
    } else {
      normal = (openSpace.toList()..shuffle()).first;
    }
    var move = winning ?? block ?? normal;
    if (move != null) {
      setState(() {
        grid[move] = 2;
      });
    }
    player = true;
    checkWin(2);
  }

  bool isWinning(int player, List<int> grid) {
    return (grid[0] == player && grid[1] == player && grid[2] == player) ||
        (grid[3] == player && grid[4] == player && grid[5] == player) ||
        (grid[6] == player && grid[7] == player && grid[8] == player) ||
        (grid[0] == player && grid[4] == player && grid[8] == player) ||
        (grid[2] == player && grid[4] == player && grid[6] == player) ||
        (grid[0] == player && grid[3] == player && grid[6] == player) ||
        (grid[6] == player && grid[7] == player && grid[8] == player) ||
        (grid[1] == player && grid[4] == player && grid[7] == player) ||
        (grid[2] == player && grid[5] == player && grid[8] == player);
  }

  bool tie() {
    return (grid[0] != 0 &&
        grid[1] != 0 &&
        grid[2] != 0 &&
        grid[3] != 0 &&
        grid[4] != 0 &&
        grid[5] != 0 &&
        grid[6] != 0 &&
        grid[7] != 0 &&
        grid[8] != 0 &&
        !isWinning(1, grid) &&
        !isWinning(2, grid));
  }
}
