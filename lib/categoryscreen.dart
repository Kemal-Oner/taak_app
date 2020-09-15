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



class CategoryScreen extends StatelessWidget {

  int count;
  bool oefenCat;
  bool speelCat;

  CategoryScreen({Key key, @required this.count, this.oefenCat, this.speelCat}) : super(key:key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            onTap: () {
              print("Dieren");
            },
            title: getDieren(),
          ),
          ListTile(
            onTap: () {
              print("Fruit");
            },
            title: getFruit(),
          ),
          ListTile(
            onTap: () {
              print("Insecten");
            },
            title: getInsecten(),
          ),
          ListTile(
            onTap: () {
              print("Groente");
            },
            title: getGroente(),
          ),
          ListTile(
            onTap: () {
              print("Dieren02");
            },
            title: getDierenTwo(),
          ),
          ListTile(
            onTap: () {
              print("Eten");
            },
            title: getEten(),
          ),
          ListTile(
            onTap: () {
              print("Kleding");
            },
            title: getKleding(),
          ),
          ListTile(
            onTap: () {
              print("Weer");
            },
            title: getWeer(),
          ),
          ListTile(
            onTap: () {
              print("Kleuren");
            },
            title: getKleuren(),
          ),
        ],
      ),
    );
  }

  Widget getTitle() {
    if (count == 0 || count == 1) {
      return Text(
        "Selecteer een categorie."
      );
    } else if (count == 2) {
      return Text(
        "Please select a category.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Porfavor seleccione una categoría.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Veuillez sélectionner une catégorie.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Bitte wählen sie eine Kategorie.",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getDieren() {
    if (count == 1 || count == 0) {
      return Text(
        "Dieren",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Animals",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Animales",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Animaux",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Tiere",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getFruit() {
    if (count == 1 || count == 0) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Fruta",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Obst",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getInsecten() {
    if (count == 1 || count == 0) {
      return Text(
        "Insecten",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Insects",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Insectos",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Insectes",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Insekten",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getGroente() {
    if (count == 1 || count == 0) {
      return Text(
        "Groente",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Vegetables",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Vegetal",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "légume",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Gemüse",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getDierenTwo() {
    if (count == 1 || count == 0) {
      return Text(
        "Dieren 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Animals 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Animales 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Animaux 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Tiere 02",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getEten() {
    if (count == 1 || count == 0) {
      return Text(
        "Eten",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Food",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Comida",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Manger",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Lebensmittel",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getKleding() {
    if (count == 1 || count == 0) {
      return Text(
        "Kleding",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Clothes",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Ropa",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Vêtements",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Kleider",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getWeer() {
    if (count == 1 || count == 0) {
      return Text(
        "Weer",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Weather",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Clima",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "La Météo",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Wetter",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getKleuren() {
    if (count == 1 || count == 0) {
      return Text(
        "Kleuren",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Colors",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Colores",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Couleurs",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Farben",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

}
