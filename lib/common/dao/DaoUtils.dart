
import 'package:redux/redux.dart';
import 'package:wanflutter/common/redux/WWFState.dart';
import 'package:wanflutter/common/net/Api.dart';
import 'package:wanflutter/common/model/MainDataEntity.dart';
import 'package:wanflutter/common/utils/NetConstant.dart';

class DaoUtils{
  static getMainPagerDatas() async{
//    String url = NetConstant.BaseUrl + NetConstant.HOME_PAGE_URL;
  String url = "http://www.mocky.io/v2/5c0795003000007700d25b77";
    var res = await HttpManager.netFetch(url, null,  null, null);
    if(res != null && res.result){
      var data = res.data;
      MainDataEntity entity = MainDataEntity.fromJson(data);
      print("");
    }
  }
}