
/**
 * 网络数据请求结果
 * */
 class ResultData {
  var data;
  bool result;
  int code;
  var headers;

  ResultData(this.data, this.result, this.code, {this.headers});
 }