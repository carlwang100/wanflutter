// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainDataEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDataEntity _$MainDataEntityFromJson(Map<String, dynamic> json) {
  return MainDataEntity(
      json['errorCode'] as int,
      json['errorMsg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MainDataEntityToJson(MainDataEntity instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data()
    ..curPage = json['curPage'] as int
    ..offset = json['offset'] as int
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as int
    ..size = json['size'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };
