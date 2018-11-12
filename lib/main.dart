import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanflutter/common/page/HomePage.dart';
import 'package:wanflutter/common/page/WelcomePage.dart';
import 'package:wanflutter/common/redux/WWFState.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  return runApp(new FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget{

  final store = new Store<WWFState>(
    appReducer,
    initialState: null,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<WWFState>(builder: (context, store){
        return new MaterialApp(
          //多语言实现代理
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          routes: {
            WelcomePage.sName: (context){
              return WelcomePage();
            },
            HomePage.sName: (context){
              return HomePage();
            }
          },
        );
      }),
    );
  }

}


