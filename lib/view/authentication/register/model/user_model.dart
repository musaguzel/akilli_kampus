import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String fullName;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'tradelink')
  String tradelink;

  @JsonKey(name: 'balance')
  int balance;

  @JsonKey(name: 'dailybonusAndCaseTimeSettings')
  Map<String, dynamic> dailybonusAndCaseTimeSettings;

  @JsonKey(name: 'usedPromoCodes')
  List<String> usedPromoCodes;

  @JsonKey(name: 'userID')
  String? userID;

  UserModel({required this.fullName, required this.email, required this.tradelink, required this.balance
  ,required this.usedPromoCodes,required this.dailybonusAndCaseTimeSettings,required this.userID});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
