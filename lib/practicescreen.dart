import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taak_app/categoryscreen.dart';

class practiceScreen extends StatelessWidget {

  final Categories category;

  practiceScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName),
      ),
    );
  }
}
