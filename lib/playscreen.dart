import 'package:flutter/cupertino.dart';

import 'categoryscreen.dart';

class playScreen extends StatefulWidget {
  final Categories category;
  bool oefenCat;
  int count;

  playScreen(this.category, this.oefenCat, this.count);

  @override
  _playScreenState createState() => _playScreenState();
}

class _playScreenState extends State<playScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
