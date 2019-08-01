
import 'dart:async';
import 'package:wanflutter/common/net/Api.dart';
import 'package:wanflutter/common/model/MainDataEntity.dart';
import 'package:wanflutter/common/utils/NetConstant.dart';
import 'DaoResult.dart';

class DaoUtils{

  static getMainPagerDatas() async{
    String url = NetConstant.BaseUrl + NetConstant.HOME_PAGE_URL;
    var res = await HttpManager.netFetch(url, null,  null, null);
    if(res != null && res.result){
      var data = res.data;
      MainDataEntity entity = MainDataEntity.fromJson(data);
      Data content = entity.data;
      List<Details> details = content.datas;
      return new DataResult(details, true);
    }
    return new DataResult(null, false);
  }
}