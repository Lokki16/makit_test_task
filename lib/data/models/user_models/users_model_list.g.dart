// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModelList _$UsersModelListFromJson(Map json) => UsersModelList(
      list: (json['list'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$UsersModelListToJson(UsersModelList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
