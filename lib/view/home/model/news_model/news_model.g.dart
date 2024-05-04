// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      title: json['baslik'] as String,
      content: json['icerik'] as String,
      imageUrl:
          (json['resim_url'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'baslik': instance.title,
      'icerik': instance.content,
      'resim_url': instance.imageUrl,
    };
