import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CategoryReply {
  List gottenData;
  int count;

  CategoryReply(this.gottenData, this.count);
}

Future<CategoryReply> getCategories() async {
  String jsonFile = await rootBundle.loadString('assets/data/categories.json');

  Map decoded = jsonDecode(jsonFile);
  List gottenData = decoded["categories"];
  int count = gottenData.length;

  var categoryReply = new CategoryReply(gottenData, count);

  return categoryReply;
}

