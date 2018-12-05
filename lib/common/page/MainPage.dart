
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanflutter/common/dao/DaoUtils.dart';
import 'package:wanflutter/common/redux/WWFState.dart';

///首页
class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() {
    // TODO: implement createState
    return new _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DaoUtils.getMainPagerDatas();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Store<WWFState> _getStore() {
    return StoreProvider.of(context);
  }

}