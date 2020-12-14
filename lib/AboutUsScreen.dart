import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  int count;

  AboutUsScreen(this.count);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getTitle(),
      ),
      body: getBody(),
    );
  }

  Widget getTitle() {
    if (count == 0 || count == 1) {
      return Text("Over Ons");
    } else if (count == 2) {
      return Text("About Us");
    } else if (count == 3) {
      return Text("Acerca de");
    } else if (count == 4) {
      return Text("À propos");
    } else if (count == 5) {
      return Text("Über");
    }

    Widget getBody() {}
  }

  getBody() {
    return Center(child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
            " incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ul"
            "lamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate"
            " velit esse cillum dolore eu fugiat nulla pariatur."
            "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
    );
  }
}
