import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Dieren {
  final String word;
  final String ned;
  final String amazigh;
  final String span;
  final String eng;
  final String fra;
  final String germ;

  Dieren(this.word, this.ned, this.amazigh, this.span, this.eng, this.fra,
      this.germ);

  Dieren.fromJson(Map<String, dynamic> json)
      : word = json['dieren01'],
        ned = json['email'],
        amazigh = json['qew'],
        span = json['qew'],
        eng = json['qwe'],
        fra = json['ewq'],
        germ = json['qwe'];
}

Future<String> _loadCategories() async {
  return await rootBundle.loadString('assets/data/categories.json');
}

Future loadCategories() async {
  String jsonPath = await _loadCategories();
  _parseJsonCategories(jsonPath);
  return jsonPath;
}

_parseJsonCategories(String jsonString) {
  Map decoded = jsonDecode(jsonString);
  print(decoded.length);
  return decoded;
}



class PracticeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Please select a category."),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              print("Dieren");
            },
            title: Text('Dieren'),
          ),
          ListTile(
            onTap: () {
              print("Fruit");
            },
            title: Text('Fruit'),
          ),
          ListTile(
            onTap: () {
              print("Insecten");
            },
            title: Text('Insecten'),
          ),
          ListTile(
            onTap: () {
              print("Groente");
            },
            title: Text('Groente'),
          ),
          ListTile(
            onTap: () {
              print("Dieren02");
            },
            title: Text('Dieren02'),
          ),
          ListTile(
            onTap: () {
              print("Eten");
            },
            title: Text('Eten'),
          ),
          ListTile(
            onTap: () {
              print("Kleding");
            },
            title: Text('Kleding'),
          ),
          ListTile(
            onTap: () {
              print("Weer");
            },
            title: Text('Weer'),
          ),
          ListTile(
            onTap: () {
              print("Kleuren");
            },
            title: Text('Kleuren'),
          ),
        ],
      ),
    );
  }
}
