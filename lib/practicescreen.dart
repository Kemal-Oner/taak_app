import 'dart:convert';

import 'package:flutter/material.dart';

class Dieren {
  final String word;
  final String ned;
  final String amazigh;
  final String span;
  final String eng;
  final String fra;
  final String germ;

  Dieren(this.word, this.ned, this.amazigh, this.span, this.eng, this.fra, this.germ);


  Dieren.fromJson(Map<String, dynamic> json)
      : word = json['dieren01'],
        ned = json['email'],
        amazigh = json['qew'],
        span = json['qew'],
        eng = json['qwe'],
        fra = json['ewq'],
        germ = json['qwe'];
}



class PracticeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ewa"),
      ),
      body: ListView(
        children: <Text>[Text("Ewa"), Text("Ewa"), Text("Ewa")],
        scrollDirection: Axis.horizontal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String test = await DefaultAssetBundle.of(context)
              .loadString("assets/data.json");
          Map<String, dynamic> map = jsonDecode(test);

          var dier = Dieren.fromJson(map);

          print(dier.word);
          // kjashdkjsahd
        },
      ),
    );
  }
}
