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

  playCategories(this.ned, this.amazigh, this.eng, this.spaans, this.frans,
      this.duits);
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
  List allIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
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
//
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
    print(answerArray);
    return new Text(
      snapshot.data[randomNumber].amazigh,
      style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 40),
    );
  }
  int indexOfAnswer;
  List pictureArray = [];
  int jowed = 0;

  Widget pictureBuilder(AsyncSnapshot snapshot) {
    if(jowed == 0) {
    int answer = answerArray[answerArray.length - 2];
    pictureArray = List.from(allIds);
    while(pictureArray.length > 6) {
      int index = random.nextInt(pictureArray.length);
      pictureArray.removeAt(index);
    }
    if(!pictureArray.contains(answer)) {
      int index = random.nextInt(pictureArray.length);
      pictureArray.removeAt(index);
      pictureArray.add(answer);
    }
    pictureArray.shuffle();
    print(pictureArray.toString());
    indexOfAnswer = pictureArray.indexOf(answer);
    print(pictureArray.length);
    print('aaaaaaa');
    jowed++;
    }
    int randomizer = random.nextInt(pictureArray.length);
    print('aaaaaaa');
    print(randomizer);
//    while (allIds.length > 6) {
//      allIds.removeAt(3);
//      allIds.shuffle();
//      if(allIds.contains(answerArray[0])) {
//        indexOfAnswer = allIds.indexOf(answerArray[0]);
//      } else {
//        allIds.removeAt(3);
//        allIds.add(answerArray[0]);
//        allIds.shuffle();
//        indexOfAnswer = allIds.indexOf(answerArray[0]);
//      }
//      print(allIds);
//    }
//      picturesArray.add(randomNumber);
    return GestureDetector(
      onTap: () {
        print(snapshot.data[pictureArray[randomizer]].ned);
        print(answerArray[1]);
        print('assets/images/'      +
            widget.category.categoryName +
            '_' +
            snapshot.data[pictureArray[randomizer]].ned +
            '.jpg');
        if (snapshot.data[pictureArray[randomizer]].ned == answerArray[1]) {
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
           allIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
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
//        if (snapshot.data[pictureArray[randomizer]].ned == answerArray[1]) {
//          Fluttertoast.showToast(
//              msg: tryCount.toString(),
//              toastLength: Toast.LENGTH_SHORT,
//              gravity: ToastGravity.BOTTOM,
//              timeInSecForIosWeb: 1,
//              backgroundColor: Colors.red,
//              textColor: Colors.white,
//              fontSize: 16.0);
//          setState(() {
//            answerArray.clear();
//            picturesArray.clear();
//            allIds = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
//            tryCount = 0;
//          });
//        } else {
//          tryCount += 1;
//          Fluttertoast.showToast(
//              msg: "Probeer het nog een keer",
//              toastLength: Toast.LENGTH_SHORT,
//              gravity: ToastGravity.BOTTOM,
//              timeInSecForIosWeb: 1,
//              backgroundColor: Colors.grey,
//              textColor: Colors.white,
//              fontSize: 16.0);
//        }
      },
      child: new SizedBox(
        child: new Container(
          child: new Image.asset(
            'assets/images/' +
                widget.category.categoryName +
                '_' +
                snapshot.data[pictureArray[randomizer]].ned +
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
