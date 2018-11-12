
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static final String sName = 'home';

  @override
  _HomePage createState() {
    // TODO: implement createState
    return  _HomePage();
  }
}

class _HomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: new Text('home pager'),
      ),
    );
  }

}