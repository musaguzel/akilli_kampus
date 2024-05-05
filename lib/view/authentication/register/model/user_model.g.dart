// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      fullName: json['fullname'] as String,
      email: json['email'] as String,
      tradelink: json['tradelink'] as String,
      balance: (json['balance'] as num).toInt(),
      usedPromoCodes: (json['usedPromoCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      dailybonusAndCaseTimeSettings:
          json['dailybonusAndCaseTimeSettings'] as Map<String, dynamic>,
      userID: json['userID'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.fullName,
      'email': instance.email,
      'tradelink': instance.tradelink,
      'balance': instance.balance,
      'dailybonusAndCaseTimeSettings': instance.dailybonusAndCaseTimeSettings,
      'usedPromoCodes': instance.usedPromoCodes,
      'userID': instance.userID,
    };
