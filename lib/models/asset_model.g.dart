// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetModelImpl _$$AssetModelImplFromJson(Map<String, dynamic> json) =>
    _$AssetModelImpl(
      id: json['id'] as String,
      locationId: json['locationId'] as String?,
      name: json['name'] as String,
      parentId: json['parentId'] as String?,
      sensorType: json['sensorType'] as String?,
      status: json['status'] as String?,
      gatewayId: json['gatewayId'] as String?,
      sensorId: json['sensorId'] as String?,
    );

Map<String, dynamic> _$$AssetModelImplToJson(_$AssetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'name': instance.name,
      'parentId': instance.parentId,
      'sensorType': instance.sensorType,
      'status': instance.status,
      'gatewayId': instance.gatewayId,
      'sensorId': instance.sensorId,
    };
