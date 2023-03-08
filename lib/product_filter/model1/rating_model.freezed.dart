// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  String get sao => throw _privateConstructorUsedError;
  String get solan => throw _privateConstructorUsedError;
  List<String> get imei => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({String sao, String solan, List<String> imei});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sao = null,
    Object? solan = null,
    Object? imei = null,
  }) {
    return _then(_value.copyWith(
      sao: null == sao
          ? _value.sao
          : sao // ignore: cast_nullable_to_non_nullable
              as String,
      solan: null == solan
          ? _value.solan
          : solan // ignore: cast_nullable_to_non_nullable
              as String,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingModelCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$_RatingModelCopyWith(
          _$_RatingModel value, $Res Function(_$_RatingModel) then) =
      __$$_RatingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sao, String solan, List<String> imei});
}

/// @nodoc
class __$$_RatingModelCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$_RatingModel>
    implements _$$_RatingModelCopyWith<$Res> {
  __$$_RatingModelCopyWithImpl(
      _$_RatingModel _value, $Res Function(_$_RatingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sao = null,
    Object? solan = null,
    Object? imei = null,
  }) {
    return _then(_$_RatingModel(
      sao: null == sao
          ? _value.sao
          : sao // ignore: cast_nullable_to_non_nullable
              as String,
      solan: null == solan
          ? _value.solan
          : solan // ignore: cast_nullable_to_non_nullable
              as String,
      imei: null == imei
          ? _value._imei
          : imei // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingModel implements _RatingModel {
  const _$_RatingModel(
      {required this.sao,
      required this.solan,
      required final List<String> imei})
      : _imei = imei;

  factory _$_RatingModel.fromJson(Map<String, dynamic> json) =>
      _$$_RatingModelFromJson(json);

  @override
  final String sao;
  @override
  final String solan;
  final List<String> _imei;
  @override
  List<String> get imei {
    if (_imei is EqualUnmodifiableListView) return _imei;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imei);
  }

  @override
  String toString() {
    return 'RatingModel(sao: $sao, solan: $solan, imei: $imei)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingModel &&
            (identical(other.sao, sao) || other.sao == sao) &&
            (identical(other.solan, solan) || other.solan == solan) &&
            const DeepCollectionEquality().equals(other._imei, _imei));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, sao, solan, const DeepCollectionEquality().hash(_imei));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      __$$_RatingModelCopyWithImpl<_$_RatingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingModelToJson(
      this,
    );
  }
}

abstract class _RatingModel implements RatingModel {
  const factory _RatingModel(
      {required final String sao,
      required final String solan,
      required final List<String> imei}) = _$_RatingModel;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$_RatingModel.fromJson;

  @override
  String get sao;
  @override
  String get solan;
  @override
  List<String> get imei;
  @override
  @JsonKey(ignore: true)
  _$$_RatingModelCopyWith<_$_RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
