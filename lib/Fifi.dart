import 'package:flutter/material.dart';

class MyPuppyDog extends StatefulWidget {
  const MyPuppyDog({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPuppyDog> createState() => MyPuppyDogState();
}

class MyPuppyDogState extends State<MyPuppyDog> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter+=100;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.pets),
            tooltip: "Notify me if I adopt 17 bajillion dogs",
            onPressed:(){

            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Hi User, please proceed to dog adopting, Every 10 thousand dogs, cost you 10 dollars Adopt at your own risk. Are you sure you want to proceed? ")
            ),
            const Text(
              'The counter below will truly show, below or on top, the amount of dogs you adopt:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



