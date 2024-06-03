import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String id,
    required String name,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, Object?> json) =>
      _$CompanyModelFromJson(json);
}
