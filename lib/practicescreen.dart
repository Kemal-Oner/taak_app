import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PracticeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ewa"),
      ),
      body: Swiper(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/288x188",
            fit: BoxFit.fill,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // kjashdkjsahd
        },
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({
    Key key,
    this.color = Colors.indigo,
    this.text = "Card Example",
  }) : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 320,

      // Warning: hard-coding values like this is a bad practice
      padding: EdgeInsets.all(38.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 7.0,
          color: Colors.transparent.withOpacity(0.3),
        ),
      ),

      child: Text(
        text,
        style: TextStyle(
          fontSize: 36.0,
          // color: Colors.white,
          color: Colors.white.withOpacity(0.8),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
