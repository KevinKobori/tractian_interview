import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String id,
    required String name,
    required String? parentId,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, Object?> json) =>
      _$LocationModelFromJson(json);
}
