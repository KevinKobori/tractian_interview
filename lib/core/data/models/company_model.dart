import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyUnitModel with _$CompanyUnitModel {
  const factory CompanyUnitModel({
    required String id,
    required String name,
  }) = _CompanyUnitModel;

  factory CompanyUnitModel.fromJson(Map<String, Object?> json) =>
      _$CompanyUnitModelFromJson(json);
}
