
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:wanflutter/common/dao/DaoResult.dart';
import 'package:wanflutter/common/dao/DaoUtils.dart';
import 'package:wanflutter/common/model/MainDataEntity.dart';
import 'package:wanflutter/common/redux/WWFState.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页
class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() {
    // TODO: implement createState
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  //这里设置变量是防止2次重绘
  Future<DataResult> future;
  List<Details> detailList = List();
  RefreshController _refreshController = RefreshController(initialRefresh: true);

  void _onRefresh() async{
     await Future.delayed(Duration(microseconds: 1000));
         _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(microseconds: 1000));
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<DataResult> snapshot) => _buildFuture(context, snapshot)
      ),
    );
  }


   Future<DataResult> getData() async {
    return await DaoUtils.getMainPagerDatas();
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot<DataResult> snapshot){
    switch(snapshot.connectionState){
      case ConnectionState.waiting:
      case ConnectionState.active:
        return Text("waiting ...");
      case ConnectionState.none:
      // TODO: Handle this case.
        break;
      case ConnectionState.done:
        if(snapshot.hasData){
          detailList = snapshot.data.data;
          return _buildDataBody();
        }
    }
    return null;
  }

  Widget _buildDataBody() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      //todo 可以填充一些数据
      footer: null,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: detailList.length,
        itemBuilder: (BuildContext ctx, int index) =>
            _buildItem(ctx, index),
      ),
    );
  }

  Widget _buildItem(BuildContext ctx, int index) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Card(
          color: Colors.white,
          elevation: 5.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          clipBehavior: Clip.antiAlias,
          semanticContainer: false,
          child: _buildCardContent(index),
        ),
      );
  }

  _buildCardContent(int index) {
    return Column(
      children: <Widget>[
        Text(
          detailList[index].title,
          style: TextStyle(color: Colors.black, fontSize: 20),
          maxLines: 1,
        ),
        Text(
          detailList[index].desc,
          style: TextStyle(color: Colors.grey, fontSize: 18),
          maxLines: 2,
        ),
        Row(
          children: <Widget>[
            Text(
              detailList[index].author,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(detailList[index].niceDate)
          ],
        )
      ],
    );
  }
}