// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anouncement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnouncementModel _$AnouncementModelFromJson(Map<String, dynamic> json) =>
    AnouncementModel(
      title: json['baslik'] as String,
      content: json['icerik'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$AnouncementModelToJson(AnouncementModel instance) =>
    <String, dynamic>{
      'baslik': instance.title,
      'icerik': instance.content,
      'image_url': instance.imageUrl,
    };
