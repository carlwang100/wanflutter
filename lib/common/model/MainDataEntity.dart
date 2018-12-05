import 'package:json_annotation/json_annotation.dart';

part 'MainDataEntity.g.dart';

@JsonSerializable()
class MainDataEntity {
  int errorCode;
  String errorMsg;
  Data data;

  MainDataEntity(
      this.errorCode,
      this.errorMsg,
      this.data,
      );
  factory MainDataEntity.fromJson(Map<String, dynamic> json) => _$MainDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataEntityToJson(this);
}

@JsonSerializable()
class Data{
  int curPage;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  Data();
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}