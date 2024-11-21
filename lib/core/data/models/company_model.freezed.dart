// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyUnitModel _$CompanyUnitModelFromJson(Map<String, dynamic> json) {
  return _CompanyUnitModel.fromJson(json);
}

/// @nodoc
mixin _$CompanyUnitModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyUnitModelCopyWith<CompanyUnitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyUnitModelCopyWith<$Res> {
  factory $CompanyUnitModelCopyWith(
          CompanyUnitModel value, $Res Function(CompanyUnitModel) then) =
      _$CompanyUnitModelCopyWithImpl<$Res, CompanyUnitModel>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$CompanyUnitModelCopyWithImpl<$Res, $Val extends CompanyUnitModel>
    implements $CompanyUnitModelCopyWith<$Res> {
  _$CompanyUnitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyUnitModelImplCopyWith<$Res>
    implements $CompanyUnitModelCopyWith<$Res> {
  factory _$$CompanyUnitModelImplCopyWith(_$CompanyUnitModelImpl value,
          $Res Function(_$CompanyUnitModelImpl) then) =
      __$$CompanyUnitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$CompanyUnitModelImplCopyWithImpl<$Res>
    extends _$CompanyUnitModelCopyWithImpl<$Res, _$CompanyUnitModelImpl>
    implements _$$CompanyUnitModelImplCopyWith<$Res> {
  __$$CompanyUnitModelImplCopyWithImpl(_$CompanyUnitModelImpl _value,
      $Res Function(_$CompanyUnitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CompanyUnitModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyUnitModelImpl implements _CompanyUnitModel {
  const _$CompanyUnitModelImpl({required this.id, required this.name});

  factory _$CompanyUnitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyUnitModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'CompanyUnitModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyUnitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyUnitModelImplCopyWith<_$CompanyUnitModelImpl> get copyWith =>
      __$$CompanyUnitModelImplCopyWithImpl<_$CompanyUnitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyUnitModelImplToJson(
      this,
    );
  }
}

abstract class _CompanyUnitModel implements CompanyUnitModel {
  const factory _CompanyUnitModel(
      {required final String id,
      required final String name}) = _$CompanyUnitModelImpl;

  factory _CompanyUnitModel.fromJson(Map<String, dynamic> json) =
      _$CompanyUnitModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$CompanyUnitModelImplCopyWith<_$CompanyUnitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
