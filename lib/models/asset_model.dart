import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
class AssetModel with _$AssetModel {
  const factory AssetModel({
    required String id,
    required String? locationId,
    required String name,
    required String? parentId,
    required String? sensorType,
    required String? status,
    String? gatewayId,
    String? sensorId,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, Object?> json) =>
      _$AssetModelFromJson(json);
}
