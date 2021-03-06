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
    ..total = json['total'] as int
    ..datas = (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : Details.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
      'datas': instance.datas
    };

Details _$DetailsFromJson(Map<String, dynamic> json) {
  return Details()
    ..apkLink = json['apkLink'] as String
    ..author = json['author'] as String
    ..chapterId = json['chapterId'] as int
    ..chapterName = json['chapterName'] as String
    ..collect = json['collect'] as bool
    ..courseId = json['courseId'] as int
    ..desc = json['desc'] as String
    ..envelopePic = json['envelopePic'] as String
    ..fresh = json['fresh'] as bool
    ..id = json['id'] as int
    ..link = json['link'] as String
    ..niceDate = json['niceDate'] as String
    ..origin = json['origin'] as String
    ..projectLink = json['projectLink'] as String
    ..publishTime = json['publishTime'] as int
    ..superChapterId = json['superChapterId'] as int
    ..superChapterName = json['superChapterName'] as String
    ..tags = (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : PublicCommunity.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..title = json['title'] as String
    ..type = json['type'] as int
    ..userId = json['userId'] as int
    ..visible = json['visible'] as int
    ..zan = json['zan'] as int;
}

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'apkLink': instance.apkLink,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };

PublicCommunity _$PublicCommunityFromJson(Map<String, dynamic> json) {
  return PublicCommunity()
    ..name = json['name'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$PublicCommunityToJson(PublicCommunity instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
