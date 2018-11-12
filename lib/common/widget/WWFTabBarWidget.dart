

import 'package:flutter/material.dart';

///tabbar控件,包含drawer
class WWFTabBarWidget extends StatefulWidget{
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color indicatorColor;
  final Widget title;
  final Widget drawer;

  const WWFTabBarWidget({Key key, this.tabItems, this.tabViews, this.backgroundColor, this.indicatorColor, this.title, this.drawer}) : super(key: key);

  @override
  _WWFTabBarState createState() {
    return new _WWFTabBarState(tabViews, indicatorColor, title, drawer);
  }
}

class _WWFTabBarState extends State<WWFTabBarWidget> with SingleTickerProviderStateMixin {

  final List<Widget> _tabViews;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  _WWFTabBarState(this._tabViews, this._indicatorColor, this._title, this._drawer) : super();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: widget.tabItems.length, vsync: this);
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
   _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      body: new TabBarView(
          controller: _tabController,//配置控制器
          children: _tabViews),
      bottomNavigationBar: new Material(
        //为了适配主题风格，包一层material实现风格套用
        color: Theme.of(context).primaryColor,//底部导航栏主题颜色
        child: new TabBar(
          controller: _tabController,
          tabs: widget.tabItems,
          indicatorColor: _indicatorColor, //tab标签的下划线颜色
        ),
      ),
    );
  }

}