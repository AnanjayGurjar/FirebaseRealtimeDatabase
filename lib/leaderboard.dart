import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final FirebaseDatabase reference = FirebaseDatabase.instance;
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final scoreController = TextEditingController();
  List<Map<String, String>> list = [];

  Widget listItem(Map player) {
    print(player);
    return Text("hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: TextFormField(
                controller: idController,
              ),
            ),
            SizedBox(
              height: 100,
              child: TextFormField(
                controller: nameController,
              ),
            ),
            SizedBox(
              height: 100,
              child: TextFormField(
                controller: scoreController,
              ),
            ),
            TextButton(
                onPressed: () {
                  pushData();
                },
                child: Text("update the scoreboard")),
            TextButton(
                onPressed: () {
                  fetchData();
                  // getAndUpdate("1");
                },
                child: Text("fetch")),
          ],
        ),
      ),
    );
  }

  void pushData() async {
    String id = idController.text.toString();
    await reference.ref('ok/$id').set({
      "name": nameController.text.toString(),
      "score": scoreController.text.toString()
    });
    idController.clear();
    nameController.clear();
    scoreController.clear();
  }

  void fetchData() {
    var scoreBoardRef = reference.ref('ok').orderByChild("score");
    scoreBoardRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as LinkedHashMap;

      for (var id in data.keys) {
        list.add({"name": data[id]['name'], "score": data[id]['score']});
      }
    });
    var timer = Timer(Duration(seconds: 3), () => {});
    timer.cancel();
  }

  void getAndUpdate(String id) async {
    DataSnapshot snapshot = await reference.ref('users').child(id).get();
    print(snapshot);
    Map hostel = snapshot.value as Map;
    print(hostel);
    var score = hostel['details']['score'];
    print(score);

    // reference.ref('users').child(id).update(hostel)
    // .then((value) => null)
    await reference.ref('users/$id').update({
      "details": {
        "name": hostel['details']['name'],
        "score": (int.parse(score) + 10).toString()
      }
    });
  }
}

//[null, {details: {score: 10, name: Ananjay}}, {details: {score: 20, name: ashish}}, {details: {score: 5, name: bhagya }}, {details: {score: 15, name: shashank }}]
