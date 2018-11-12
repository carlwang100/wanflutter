
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static final String sName = 'home';

  ///单击提示退出
  Future<bool> _dialogExitApp(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        content: new Text('确定要退出应用？'),
        actions: <Widget>[
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop(false);
              },
              child: new Text('取消')),
          new FlatButton(
              onPressed: (){
                Navigator.of(context).pop(true);
              },
              child: new Text('确定')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new Scaffold(
        body: Text('homepage'),
      ),
        );
  }

}