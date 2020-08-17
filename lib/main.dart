import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

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

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 150.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    print("Dutch");
                  },
                  child: Image.asset(
                    'assets/images/dutch_flag.jpg',
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    print("English");
                  },
                  child: Image.asset(
                    'assets/images/english_flag.jpg',
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    print("Spanish");
                  },
                  child: Image.asset(
                    'assets/images/spanish_flag.png',
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    print("French");
                  },
                  child: Image.asset(
                    'assets/images/french_flag.jpg',
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
              Expanded(
                child: new GestureDetector(
                  onTap: () {
                    print("German");
                  },
                  child: Image.asset(
                    'assets/images/german_flag.jpg',
                    height: 75,
                    width: 75,
                  ),
                ),
              ),
            ],
          ),
        ),
        FlatButton(
          color: Colors.lightBlue[900],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          onPressed: () {
            /*...*/
          },
          child: Text(
            "Oefen",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        FlatButton(
          color: Colors.yellow[800],
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            /*...*/
          },
          child: Text(
            "Speel",
            style: TextStyle(fontSize: 20.0),
          ),
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
          child: Text(
            "Score",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.black,
          padding: EdgeInsets.all(8.0),
          onPressed: () {
            /*...*/
          },
          child: Text(
            "Over",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
