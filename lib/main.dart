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
      body: new Text('Hi'),
    );
  }
}
