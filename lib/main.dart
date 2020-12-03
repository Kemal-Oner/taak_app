import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'AboutUsScreen.dart';
import 'categoryscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new SecondScreen(),
      title: new Text(
        'Learn Amazigh!',
        textScaleFactor: 2,
      ),
      image: new Image.network('https://i.redd.it/u4trakomhbu01.png'),
      photoSize: 100.0,
      loaderColor: Colors.green,
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Learn Amazigh!")),
      body: new Content(),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int count = 0;
  bool oefenCat = false;
  bool speelCat = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Spacer(flex: 1,),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: new GestureDetector(
              onTap: () {
                setState(() {
                  count = 1;
                });
              },
              child: Image.asset(
                'assets/images/dutch_flag.jpg',
                height: 55,
                width: 55,
              ),
            ),
          ),
          Expanded(
            child: new GestureDetector(
              onTap: () {
                setState(() {
                  count = 2;
                });
              },
              child: Image.asset(
                'assets/images/english_flag.jpg',
                height: 55,
                width: 55,
              ),
            ),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: new GestureDetector(
              onTap: () {
                setState(() {
                  count = 5;
                });
              },
              child: Image.asset(
                'assets/images/german_flag.jpg',
                height: 55,
                width: 55,
              ),
            ),
          ),
        ]),
//        Spacer(),
        Row(
          children: [
            Expanded(
              child: new GestureDetector(
                onTap: () {
                  setState(() {
                    count = 3;
                  });
                },
                child: Image.asset(
                  'assets/images/spanish_flag.png',
                  height: 55,
                  width: 55,
                ),
              ),
            ),
            Expanded(
              child: new GestureDetector(
                onTap: () {
                  setState(() {
                    count = 4;
                  });
                },
                child: Image.asset(
                  'assets/images/french_flag.jpg',
                  height: 55,
                  width: 55,
                ),
              ),
            ),
          ],
        ),

        Spacer(flex: 5,),

        FlatButton(
          color: Colors.lightBlue[900],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          onPressed: () {
            oefenCat = true;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(
                  count: count,
                  speelCat: speelCat,
                  oefenCat: oefenCat,
                ),
              ),
            ).then((value) => setState(() {
                  speelCat = false;
                  oefenCat = false;
                }));
          },
          child: getOefen(),
        ),
        FlatButton(
          color: Colors.yellow[800],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            speelCat = true;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(
                  count: count,
                  speelCat: speelCat,
                  oefenCat: oefenCat,
                ),
              ),
            ).then((value) => setState(() {
                  speelCat = false;
                  oefenCat = false;
                }));
          },
          child: getSpeel(),
        ),
        FlatButton(
          color: Colors.red[700],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            /*...*/
          },
          child: getScore(),
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutUsScreen(count),
              ),
            );
          },
          child: getOver(),
        ),
        Spacer(flex: 3,),
      ],
    );
  }

  Widget getOefen() {
    if (count == 1 || count == 0) {
      return Text(
        "Oefen",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Practice",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Práctica",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Pratiquer",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Üben",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getSpeel() {
    if (count == 1 || count == 0) {
      return Text(
        "Speel",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Play",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Jugar",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "Jouer",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Abspielen",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getScore() {
    if (count == 1 || count == 0) {
      return Text(
        "Score",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "Score",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Puntuación",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "But",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Ergebnis",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }

  Widget getOver() {
    if (count == 1 || count == 0) {
      return Text(
        "Over",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 2) {
      return Text(
        "About",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 3) {
      return Text(
        "Acerca de",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 4) {
      return Text(
        "À propos",
        style: TextStyle(fontSize: 20.0),
      );
    } else if (count == 5) {
      return Text(
        "Über",
        style: TextStyle(fontSize: 20.0),
      );
    }
  }
}
