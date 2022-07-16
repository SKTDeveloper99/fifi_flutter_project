import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DatabaseReference db = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/dog.png'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: const Color.fromRGBO(255,255,255,0.9),
            ),
            const SizedBox(height: 50,),
            StreamBuilder(stream: db.child('DogFacts')
              .orderByKey()
              .limitToLast(20)
              .onValue,
            builder: (context,snapshot) {
              final tilesList = <ListTile> [];
              if(snapshot.hasData) {
                final cardsList = Map<String,dynamic>.from(
                    (snapshot.data! as DatabaseEvent).snapshot.value as Map);
                cardsList.forEach((key, value) {
                  final nextCard = HashMap<String,dynamic>.from(value);
                  final orderTile = ListTile(
                      leading: const Icon(Icons.local_cafe),
                      title: Text(nextCard['fact']));
                  tilesList.add(orderTile);
                });
              }
                  return ListView(
                    children: tilesList,
                  );
            })
          ],
        )
    );
  }
}




