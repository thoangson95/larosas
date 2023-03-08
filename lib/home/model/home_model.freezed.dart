// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
mixin _$HomeModel {
  String get namevi => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get slogan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res, HomeModel>;
  @useResult
  $Res call({String namevi, String logo, String slogan});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res, $Val extends HomeModel>
    implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namevi = null,
    Object? logo = null,
    Object? slogan = null,
  }) {
    return _then(_value.copyWith(
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      slogan: null == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String namevi, String logo, String slogan});
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res>
    extends _$HomeModelCopyWithImpl<$Res, _$_HomeModel>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? namevi = null,
    Object? logo = null,
    Object? slogan = null,
  }) {
    return _then(_$_HomeModel(
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      slogan: null == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeModel with DiagnosticableTreeMixin implements _HomeModel {
  const _$_HomeModel(
      {required this.namevi, required this.logo, required this.slogan});

  factory _$_HomeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeModelFromJson(json);

  @override
  final String namevi;
  @override
  final String logo;
  @override
  final String slogan;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeModel(namevi: $namevi, logo: $logo, slogan: $slogan)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeModel'))
      ..add(DiagnosticsProperty('namevi', namevi))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('slogan', slogan));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            (identical(other.namevi, namevi) || other.namevi == namevi) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.slogan, slogan) || other.slogan == slogan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, namevi, logo, slogan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeModelToJson(
      this,
    );
  }
}

abstract class _HomeModel implements HomeModel {
  const factory _HomeModel(
      {required final String namevi,
      required final String logo,
      required final String slogan}) = _$_HomeModel;

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$_HomeModel.fromJson;

  @override
  String get namevi;
  @override
  String get logo;
  @override
  String get slogan;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
