import 'dart:convert';
import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:taak_app/playscreen.dart';
import 'package:taak_app/practicescreen.dart';

//class JsonTime {
//  static Future<String> _loadCategories() async {
//    return await rootBundle.loadString('assets/data/data.json');
//  }
//
//  static Future loadCategories() async {
//    String jsonPath = await _loadCategories();
//    _parseJsonCategories(jsonPath);
//    return jsonPath;
//  }
//
//  static _parseJsonCategories(String jsonString) {
//    Map decoded = jsonDecode(jsonString);
//    print("========================");
//    if (decoded["Dieren01"][0]["Ned"] == "ezel") {
//      print("Het is gelijk aan EZEL!");
//    }
//    print(decoded.length);
//    print("========================");
////  return decoded;
//  }
//
//}

class Categories {
  final String categoryName;

  Categories(this.categoryName);
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

    if (widget.count == 0 || widget.count == 1) {
      for (var i in jsonData["categoriesDutch"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if (widget.count == 2) {
      for (var i in jsonData["categoriesEnglish"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if (widget.count == 3) {
      for (var i in jsonData["categoriesSpanish"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if (widget.count == 4) {
      for (var i in jsonData["categoriesFrench"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    } else if (widget.count == 5) {
      for (var i in jsonData["categoriesGerman"]) {
        Categories category = Categories(i["naam"]);

        categories.add(category);
      }
    }

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
            if (snapshot.data == null) {
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
                      if (widget.oefenCat == true) {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => PracticeScreen(
                                    snapshot.data[index], widget.oefenCat, widget.count)));
                      }

                      if (widget.speelCat == true) {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => playScreen(
                                    snapshot.data[index], widget.speelCat, widget.count)));
                      }
                    },
                    title: Text(snapshot.data[index].categoryName),
                  );
                });
          },
        )
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
}
