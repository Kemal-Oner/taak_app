import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Categories {
  final String categoryName;

  Categories(this.categoryName);
}

class JsonTime {
  static Future<String> _loadCategories() async {
    return await rootBundle.loadString('assets/data/data.json');
  }

  static Future loadCategories() async {
    String jsonPath = await _loadCategories();
    _parseJsonCategories(jsonPath);
    return jsonPath;
  }

  static _parseJsonCategories(String jsonString) {
    Map decoded = jsonDecode(jsonString);
    print("========================");
    if (decoded["Dieren01"][0]["Ned"] == "ezel") {
      print("Het is gelijk aan EZEL!");
    }
    print(decoded.length);
    print("========================");
//  return decoded;
  }

}

class CategoryScreen extends StatefulWidget {
  int count;
  bool oefenCat;
  bool speelCat;

  CategoryScreen({Key key, @required this.count, this.oefenCat, this.speelCat})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Future<List<Categories>> _getCategories() async {
    var data = await rootBundle.loadString('assets/data/categories.json');

    var jsonData = json.decode(data);

    List<Categories> categories = [];

    if(widget.count == 0 || widget.count == 1) {
      for (var i in jsonData["categoriesDutch"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if(widget.count == 2) {
      for (var i in jsonData["categoriesEnglish"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if(widget.count == 3) {
      for (var i in jsonData["categoriesSpanish"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if(widget.count == 4) {
      for (var i in jsonData["categoriesFrench"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if(widget.count == 5) {
      for (var i in jsonData["categoriesGerman"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    }

    
    print(categories.length);
    return categories;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: getContent(),
    );
  }

  Widget getContent() {
    return Column(
      children: <Widget>[

        FutureBuilder(
          future: _getCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null ) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            }

            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      print(snapshot.data[index].categoryName);
                    },
                    title: Text(snapshot.data[index].categoryName),
                  );
                });
          },
        )

//        ListTile(
//          onTap: () {
//            print("Dieren");
//            JsonTime.loadCategories();
//          },
//          title: getDieren(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Fruit");
//          },
//          title: getFruit(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Insecten");
//          },
//          title: getInsecten(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Groente");
//          },
//          title: getGroente(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Dieren02");
//          },
//          title: getDierenTwo(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Eten");
//          },
//          title: getEten(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Kleding");
//          },
//          title: getKleding(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Weer");
//          },
//          title: getWeer(),
//        ),
//        ListTile(
//          onTap: () {
//            print("Kleuren");
//          },
//          title: getKleuren(),
//        ),
      ],
    );
  }

  Widget getTitle() {
    if (widget.count == 0 || widget.count == 1) {
      return Text("Selecteer een categorie.");
    } else if (widget.count == 2) {
      return Text(
        "Please select a category.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Porfavor seleccione una categoría.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Veuillez sélectionner une catégorie.",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Bitte wählen sie eine Kategorie.",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getDieren() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Dieren",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Animals",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Animales",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Animaux",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Tiere",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getFruit() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Fruta",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Fruit",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Obst",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getInsecten() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Insecten",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Insects",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Insectos",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Insectes",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Insekten",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getGroente() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Groente",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Vegetables",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Vegetal",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "légume",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Gemüse",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getDierenTwo() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Dieren 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Animals 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Animales 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Animaux 02",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Tiere 02",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getEten() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Eten",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Food",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Comida",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Manger",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Lebensmittel",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getKleding() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Kleding",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Clothes",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Ropa",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Vêtements",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Kleider",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getWeer() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Weer",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Weather",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Clima",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "La Météo",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Wetter",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getKleuren() {
    if (widget.count == 1 || widget.count == 0) {
      return Text(
        "Kleuren",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 2) {
      return Text(
        "Colors",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 3) {
      return Text(
        "Colores",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 4) {
      return Text(
        "Couleurs",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (widget.count == 5) {
      return Text(
        "Farben",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
