import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(anyMap: true)
class UserModel {
  int id;
  String name;
  String username;
  String email;
  Map address;
  String phone;
  String website;
  Map company;

  @override
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map json) => _$UserModelFromJson(json);

  Map toJson() => _$UserModelToJson(this);
}
