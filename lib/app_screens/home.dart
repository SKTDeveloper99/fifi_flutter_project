import 'package:fifi_flutter_project/app_screens/adoption_form.dart';
import 'package:fifi_flutter_project/app_screens/search_page.dart';
import 'package:fifi_flutter_project/app_screens/settings.dart';
import 'package:fifi_flutter_project/app_screens/splash_screen_game.dart';
import 'package:fifi_flutter_project/game/game_main_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //function that creates a card for the dashboard
  Card makeDashboardItem(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Color(0xFFCC5CDB),
              Color(0xffffffff),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        )
            : BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Colors.pink,
              Colors.amber,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreenGame()));
            }
            if (index == 1) {
              //2.item
              // navigate to pledge screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title:"LUNA MAJORITY IS MINE")));
            }
            if (index == 2) {
              //3.item
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SearchPage()));
            }
            if (index == 3) {
              //4.item
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            }

          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 158, 219) ,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Puppy Adoption Simulator",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem("Play", "assets/play.png", 0),
                makeDashboardItem("Pledge", "assets/dog.png", 1),
                makeDashboardItem("Browse", "assets/information.png", 2),
                makeDashboardItem("Settings", "assets/settings.png", 3),
              ],
            ),
          )

        ],

      ),
    );
  }
}
