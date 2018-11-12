
import 'package:flutter/cupertino.dart';
import 'package:wanflutter/common/page/HomePage.dart';

/**
 * 导航栏
 * */
class NavigatorUtils {

  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

}