// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) {
  return _AssetModel.fromJson(json);
}

/// @nodoc
mixin _$AssetModel {
  String get id => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get sensorType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get gatewayId => throw _privateConstructorUsedError;
  String? get sensorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetModelCopyWith<AssetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetModelCopyWith<$Res> {
  factory $AssetModelCopyWith(
          AssetModel value, $Res Function(AssetModel) then) =
      _$AssetModelCopyWithImpl<$Res, AssetModel>;
  @useResult
  $Res call(
      {String id,
      String? locationId,
      String name,
      String? parentId,
      String? sensorType,
      String? status,
      String? gatewayId,
      String? sensorId});
}

/// @nodoc
class _$AssetModelCopyWithImpl<$Res, $Val extends AssetModel>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationId = freezed,
    Object? name = null,
    Object? parentId = freezed,
    Object? sensorType = freezed,
    Object? status = freezed,
    Object? gatewayId = freezed,
    Object? sensorId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorType: freezed == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayId: freezed == gatewayId
          ? _value.gatewayId
          : gatewayId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorId: freezed == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetModelImplCopyWith<$Res>
    implements $AssetModelCopyWith<$Res> {
  factory _$$AssetModelImplCopyWith(
          _$AssetModelImpl value, $Res Function(_$AssetModelImpl) then) =
      __$$AssetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? locationId,
      String name,
      String? parentId,
      String? sensorType,
      String? status,
      String? gatewayId,
      String? sensorId});
}

/// @nodoc
class __$$AssetModelImplCopyWithImpl<$Res>
    extends _$AssetModelCopyWithImpl<$Res, _$AssetModelImpl>
    implements _$$AssetModelImplCopyWith<$Res> {
  __$$AssetModelImplCopyWithImpl(
      _$AssetModelImpl _value, $Res Function(_$AssetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locationId = freezed,
    Object? name = null,
    Object? parentId = freezed,
    Object? sensorType = freezed,
    Object? status = freezed,
    Object? gatewayId = freezed,
    Object? sensorId = freezed,
  }) {
    return _then(_$AssetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorType: freezed == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      gatewayId: freezed == gatewayId
          ? _value.gatewayId
          : gatewayId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorId: freezed == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetModelImpl implements _AssetModel {
  const _$AssetModelImpl(
      {required this.id,
      required this.locationId,
      required this.name,
      required this.parentId,
      required this.sensorType,
      required this.status,
      this.gatewayId,
      this.sensorId});

  factory _$AssetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? locationId;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final String? sensorType;
  @override
  final String? status;
  @override
  final String? gatewayId;
  @override
  final String? sensorId;

  @override
  String toString() {
    return 'AssetModel(id: $id, locationId: $locationId, name: $name, parentId: $parentId, sensorType: $sensorType, status: $status, gatewayId: $gatewayId, sensorId: $sensorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.sensorType, sensorType) ||
                other.sensorType == sensorType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.gatewayId, gatewayId) ||
                other.gatewayId == gatewayId) &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, locationId, name, parentId,
      sensorType, status, gatewayId, sensorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      __$$AssetModelImplCopyWithImpl<_$AssetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetModelImplToJson(
      this,
    );
  }
}

abstract class _AssetModel implements AssetModel {
  const factory _AssetModel(
      {required final String id,
      required final String? locationId,
      required final String name,
      required final String? parentId,
      required final String? sensorType,
      required final String? status,
      final String? gatewayId,
      final String? sensorId}) = _$AssetModelImpl;

  factory _AssetModel.fromJson(Map<String, dynamic> json) =
      _$AssetModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get locationId;
  @override
  String get name;
  @override
  String? get parentId;
  @override
  String? get sensorType;
  @override
  String? get status;
  @override
  String? get gatewayId;
  @override
  String? get sensorId;
  @override
  @JsonKey(ignore: true)
  _$$AssetModelImplCopyWith<_$AssetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
