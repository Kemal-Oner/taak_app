import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'categoryscreen.dart';

class playCategories {
  final String ned;
  final String amazigh;
  final String eng;
  final String spaans;
  final String frans;
  final String duits;

  playCategories(
      this.ned, this.amazigh, this.eng, this.spaans, this.frans, this.duits);
}

class playScreen extends StatefulWidget {
  final Categories category;
  bool oefenCat;
  int count;

  playScreen(this.category, this.oefenCat, this.count);

  @override
  _playScreenState createState() => _playScreenState();
}

class _playScreenState extends State<playScreen> {
  var random = new Random();
  List answerArray = [];
  List picturesArray = [];
  List arrayLength = [];
  int tryCount = 0;

  Future<List<playCategories>> _getPlayCategories() async {
    var data = await rootBundle.loadString('assets/data/data.json');
    var jsonData = json.decode(data);

    List<playCategories> speelCategories = [];

    for (var i in jsonData[widget.category.categoryName]) {
      playCategories oefenCategory = playCategories(
        i["Ned"],
        i["Amazigh"],
        i["Eng"],
        i["Spaans"],
        i["Frans"],
        i["Duits"],
      );
      speelCategories.add(oefenCategory);
    }

    return speelCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Let's Play!"),
      ),
      body: getContent(),
    );
  }

  Widget getContent() {
    return FutureBuilder(
      future: _getPlayCategories(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text("Loading..."),
            ),
          );
        }

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new SizedBox(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(top: 6.0, bottom: 25.0),
                    child: getAnswerText(snapshot),
                  ),
                  new Row(
                    children: <Widget>[
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                      pictureBuilder(snapshot),
                      new Spacer(),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: 1,
        );
      },
    );
  }

  Widget getAnswerText(AsyncSnapshot snapshot) {
    int randomNumber = random.nextInt(11);
    answerArray.add(randomNumber);
    answerArray.add(snapshot.data[randomNumber].ned);
    return new Text(
      snapshot.data[randomNumber].amazigh,
      style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 40),
    );
  }

  Widget pictureBuilder(AsyncSnapshot snapshot) {
    int randomNumber = answerArray[0];
    while (picturesArray.contains(randomNumber)) {
      randomNumber = random.nextInt(11);
    }
    picturesArray.add(randomNumber);
    return GestureDetector(
      onTap: () {
        if (snapshot.data[randomNumber].ned == answerArray[1]) {
          Fluttertoast.showToast(
              msg: tryCount.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          setState(() {
            answerArray.clear();
            picturesArray.clear();
            tryCount = 0;
          });
        } else {
          tryCount += 1;
          Fluttertoast.showToast(
              msg: "Probeer het nog een keer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: new SizedBox(
        child: new Container(
          child: new Image.asset(
            'assets/images/' +
                widget.category.categoryName +
                '_' +
                snapshot.data[randomNumber].ned +
                '.jpg',
            fit: BoxFit.contain,
            height: 150.0,
            width: 150.0,
          ),
        ),
      ),
    );
  }
}
