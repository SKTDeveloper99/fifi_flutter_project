import 'package:fifi_flutter_project/app_screens/home.dart';
import 'package:fifi_flutter_project/game/beginner_mode.dart';
import 'package:fifi_flutter_project/game/easy_mode.dart';
import 'package:fifi_flutter_project/game/hard_mode.dart';
import 'package:fifi_flutter_project/game/insane_mode.dart';
import 'package:fifi_flutter_project/game/intermediate_mode.dart';
import 'package:flutter/material.dart';

class GameSelection extends StatefulWidget {
  const GameSelection({Key? key}) : super(key: key);

  @override
  _GameSelectionState createState() => _GameSelectionState();
}

class _GameSelectionState extends State<GameSelection> {
  var grid = List.filled(9,0);
  var player = true;
  var game = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () =>                       Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Home())),
          ),
        ),
        body: Stack(
          children:[
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/dog_background.jpg'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: const Color.fromRGBO(255,255,255,0.7),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EasyMode()));
                        },
                        label: const Icon(Icons.people_alt, size: 30),
                        icon: const Text(
                          'Easy Mode',
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(210, 80),
                        )
                    ),
                  ),
                  Center(
                      child: ElevatedButton.icon(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const BeginnerMode()));
                          },
                          label: const Icon(Icons.desktop_windows, size: 30),
                          icon: const Text(
                            'Beginner Mode',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(210, 80),
                          )
                      )
                  ),
                  Center(
                      child: ElevatedButton.icon(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const IntermediateMode()));
                          },
                          label: const Icon(Icons.adb, size: 30),
                          icon: const Text(
                            'Intermediate Mode',
                            style: TextStyle(fontSize: 18.5),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(210, 80),
                          )
                      )
                  ),
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HardMode()));
                        },
                        label: const Icon(Icons.people_alt, size: 30),
                        icon: const Text(
                          'Hard Mode',
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(210, 80),
                        )
                    ),
                  ),
                  Center(
                    child: ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const InsaneMode()));
                        },
                        label: const Icon(Icons.people_alt, size: 30),
                        icon: const Text(
                          'Insane Mode',
                          style: TextStyle(fontSize: 25),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(210, 80),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  )
                ]
            ),
          ],

        )
    );
  }
}
