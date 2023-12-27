import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/news.dart';

part 'news_article.g.dart';

@JsonSerializable(fieldRename: FieldRename.none,createToJson: false)
class NewsArticleModel extends NewsEntity{

  NewsArticleModel({
    required super.publishedAt,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.content});

  factory NewsArticleModel.fromJson(Map<String,dynamic> data) =>
      _$NewsArticleModelFromJson(data);
}