
import 'package:json_annotation/json_annotation.dart';
part 'anouncement_model.g.dart';

@JsonSerializable()
class AnouncementModel {
  @JsonKey(name: 'baslik')
  String title;

  @JsonKey(name: 'icerik')
  String content;

  @JsonKey(name: 'image_url')
  String? imageUrl;



  AnouncementModel({required this.title, required this.content, required this.imageUrl});

  factory AnouncementModel.fromJson(Map<String, dynamic> json) => _$AnouncementModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnouncementModelToJson(this);
}
