import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: 'baslik')
  String title;

  @JsonKey(name: 'icerik')
  String content;

  @JsonKey(name: 'resim_url')
  List<String> imageUrl;



  NewsModel({required this.title, required this.content, required this.imageUrl});

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
