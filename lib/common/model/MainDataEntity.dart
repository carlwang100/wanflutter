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
  List<Details> datas;

  Data();
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Details {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List<PublicCommunity> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  Details();

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class PublicCommunity {
  String name;
  String url;
  PublicCommunity();
  factory PublicCommunity.fromJson(Map<String, dynamic> json) => _$PublicCommunityFromJson(json);
  Map<String, dynamic> toJson() => _$PublicCommunityToJson(this);

}