import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'ResultData.dart';
import 'Code.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  static netFetch(url, params, Map<String, String> header, Options option, {noTip = false}) async {
    ///检测网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      //todo 实现网络数据结果返回
      return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip), false, Code.NETWORK_ERROR);
    }
    Map<String, String> headers = new HashMap();
    if(header != null){
      headers.addAll(header);
    }

    if(option != null){
      option.headers = headers;
    }else{
      option = new Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = 15000;
    Dio dio = new Dio();

    ///设置代理便于抓包
//    dio.onHttpClientCreate = (HttpClient client) {
//      client.findProxy = (uri) {
//        return "PROXY 10.247.18.186:8888";
//      };
//    };

    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      print('请求异常: ' + e.toString());
      print('请求异常url: ' + url);
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    print('请求url: ' + url);
    print('请求头: ' + option.headers.toString());
    if (params != null) {
      print('请求参数: ' + params.toString());
    }
    if (response != null) {
      print('返回参数: ' + response.toString());
    }
    if (optionParams["authorizationCode"] != null) {
      print('authorizationCode: ' + optionParams["authorizationCode"]);
    }

    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);

  }


}
