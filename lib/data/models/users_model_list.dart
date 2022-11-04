import 'package:json_annotation/json_annotation.dart';
import 'package:makit_test_task/data/models/user_model.dart';

part 'users_model_list.g.dart';

@JsonSerializable(anyMap: true)
class UsersModelList {
  List<UserModel> list;

  @override
  UsersModelList({required this.list});

  factory UsersModelList.fromJson(Map json) => _$UsersModelListFromJson(json);

  Map toJson() => _$UsersModelListToJson(this);
}
