import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanflutter/common/redux/WWFState.dart';
import 'package:wanflutter/common/style/WWFStyle.dart';
import 'package:wanflutter/common/utils/NavigatorUtils.dart';

/**
 * 欢迎页
 */

class WelcomePage extends StatefulWidget{
  static final  String sName = "/";

  @override
  _WelcomePageState createState() {
    // TODO: implement createState
    return _WelcomePageState();
  }

}

class _WelcomePageState extends State<WelcomePage>{

  bool hadInit = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder<WWFState>(
      builder: (context, store){
        return new Container(
          color: Color(WWWFStyle.white),
          child: new Center(
            child: new Image.asset('static/images/welcome.png'),
//            child: new Image(image: new AssetImage('static/images/welcome.png')),
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if(hadInit)return;
    hadInit = true;
    Store<WWFState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2), (){
      NavigatorUtils.goHome(context);
    });
  }

}