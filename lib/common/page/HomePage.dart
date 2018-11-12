
import 'package:flutter/material.dart';
import 'package:wanflutter/common/page/FrameWorkPage.dart';
import 'package:wanflutter/common/page/MainPage.dart';
import 'package:wanflutter/common/page/MyPage.dart';
import 'package:wanflutter/common/page/ProgramPage.dart';
import 'package:wanflutter/common/widget/WWFTabBarWidget.dart';

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

  _renderTab(icon, text){
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, size: 16.0), new Text(text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(Icons.home, '首页'),
      _renderTab(Icons.bookmark, '体系'),
      _renderTab(Icons.burst_mode, '项目'),
      _renderTab(Icons.person, '我')
    ];
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new WWFTabBarWidget(
        tabItems: tabs,
        tabViews: [
          new MainPage(),
          new FrameWorkPage(),
          new ProgramPage(),
          new MyPage(),
        ],
        backgroundColor: Color(0xFF42464b),
        indicatorColor: Colors.white,
      ),

        );
  }

}