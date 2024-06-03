// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetModelImpl _$$AssetModelImplFromJson(Map<String, dynamic> json) =>
    _$AssetModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$$AssetModelImplToJson(_$AssetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
    };
