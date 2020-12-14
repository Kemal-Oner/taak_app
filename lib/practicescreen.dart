import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:taak_app/categoryscreen.dart';
import 'package:audioplayers/audio_cache.dart';

final AudioCache player = AudioCache(prefix: 'assets/audio/');

class practiceCategories {
  final String ned;
  final String amazigh;
  final String eng;
  final String spaans;
  final String frans;
  final String duits;

  practiceCategories(
      this.ned, this.amazigh, this.eng, this.spaans, this.frans, this.duits);
}

class PracticeScreen extends StatefulWidget {
  final Categories category;
  bool oefenCat;
  int count;

  PracticeScreen(this.category, this.oefenCat, this.count);

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  Future<List<practiceCategories>> _getPracticeCategories() async {
    var data = await rootBundle.loadString('assets/data/data.json');
    var jsonData = json.decode(data);

    List<practiceCategories> oefenCategories = [];

    for (var i in jsonData[widget.category.categoryName]) {
      practiceCategories oefenCategory = practiceCategories(
        i["Ned"],
        i["Amazigh"],
        i["Eng"],
        i["Spaans"],
        i["Frans"],
        i["Duits"],
      );
      oefenCategories.add(oefenCategory);
    }

    return oefenCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.categoryName),
      ),
      body: FutureBuilder(
        future: _getPracticeCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          }

          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new SizedBox(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(top: 6.0, bottom: 25.0),
                      child: new Text(
                        snapshot.data[index].amazigh,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 40),
                      ),
                    ),
                    new SizedBox(
                      child: new Container(
                        child: new Image.asset(
                          'assets/images/' +
                              widget.category.categoryName +
                              '_' +
                              snapshot.data[index].ned +
                              '.jpg',
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 6.0, bottom: 25.0),
                      child: new Text((() {
                        if(widget.count == 0 || widget.count == 1) {
                          return snapshot.data[index].ned;
                        } else if(widget.count == 2) {
                          return snapshot.data[index].eng;
                        } else if(widget.count == 3) {
                          return snapshot.data[index].spaans;
                        } else if(widget.count == 4) {
                          return snapshot.data[index].frans;
                        } else if(widget.count == 5) {
                          return snapshot.data[index].duits;
                        }
                      }()),
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 40),
                      ),
                    ),
                    new FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        if(widget.category.categoryName == 'dieren01' || widget.category.categoryName == 'animals01' || widget.category.categoryName == 'tiere01' || widget.category.categoryName == 'animales01' || widget.category.categoryName == 'animaux01' ) {
                          player.play('dieren01' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'fruit' || widget.category.categoryName == 'obst' || widget.category.categoryName == 'fruta') {
                          player.play('fruit' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'insecten' || widget.category.categoryName == 'insects' || widget.category.categoryName == 'insekten' || widget.category.categoryName == 'insectos' || widget.category.categoryName == 'insectes' ) {
                          player.play('insecten' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'groente' || widget.category.categoryName == 'vegetables' || widget.category.categoryName == 'gemüse' || widget.category.categoryName == 'vegetal' || widget.category.categoryName == 'légume' ) {
                          player.play('groente' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'dieren02' || widget.category.categoryName == 'animals02' || widget.category.categoryName == 'tiere02' || widget.category.categoryName == 'animales02' || widget.category.categoryName == 'animaux02' ) {
                          player.play('dieren02' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'eten' || widget.category.categoryName == 'food' || widget.category.categoryName == 'lebensmittel' || widget.category.categoryName == 'comida' || widget.category.categoryName == 'manger' ) {
                          player.play('eten' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'kleding' || widget.category.categoryName == 'clothing' || widget.category.categoryName == 'kleider' || widget.category.categoryName == 'ropa' || widget.category.categoryName == 'vetements' ) {
                          player.play('kleding' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'weer' || widget.category.categoryName == 'weather' || widget.category.categoryName == 'wetter' || widget.category.categoryName == 'clima' || widget.category.categoryName == 'lamétéo' ) {
                          player.play('weer' + '_' + snapshot.data[index].ned + '.mp3');
                        } else if(widget.category.categoryName == 'kleuren' || widget.category.categoryName == 'colors' || widget.category.categoryName == 'farben' || widget.category.categoryName == 'colores' || widget.category.categoryName == 'couleurs' ) {
                          player.play('kleuren' + '_' + snapshot.data[index].ned + '.mp3');
                        }
                        print(widget.category.categoryName + '_' + snapshot.data[index].ned + '.mp3');
//                        player.play(widget.category.categoryName + '_' + snapshot.data[index].ned + '.mp3');
                      },
                      color: Colors.blue,
                      child:
                          Text("Play Sound", style: TextStyle(fontSize: 20.0)),
                    )
                  ],
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        },
      ),
    );

  }
}