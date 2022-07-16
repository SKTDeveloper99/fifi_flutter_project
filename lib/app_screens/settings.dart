import 'package:flutter/material.dart';

import 'package:fifi_flutter_project/login_screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/dog.png'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.7),
            ),
            ListTile(
              leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/dog.png'),
                  ),
                ),
              ),
              title: const Text('Log Out'),
              dense: false,
            )
          ],
        )
    );
  }
}

