import 'package:flutter/material.dart';

import '../Fifi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter full name."
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter date of birth.")
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your email.")
              ),

              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Do you have a dog, and do you want one or another one?.")
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your phone number.")
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your credit card number.")
              ),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your address.")
              ),
              Text(

                'Click below to sign an undoable contract to therefore give up everything for access to unlimited puppies.                                    ----------->',

              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder:(context) => const MyPuppyDog(title: "❤️ 🌟 ❤️")),
          );
        },
        tooltip:"increment",
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
