// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_categories_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeCategoriesModel _$HomeCategoriesModelFromJson(Map<String, dynamic> json) {
  return _HomeCategoriesModel.fromJson(json);
}

/// @nodoc
mixin _$HomeCategoriesModel {
  String get id => throw _privateConstructorUsedError;
  String get namevi => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeCategoriesModelCopyWith<HomeCategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCategoriesModelCopyWith<$Res> {
  factory $HomeCategoriesModelCopyWith(
          HomeCategoriesModel value, $Res Function(HomeCategoriesModel) then) =
      _$HomeCategoriesModelCopyWithImpl<$Res, HomeCategoriesModel>;
  @useResult
  $Res call({String id, String namevi, String photo});
}

/// @nodoc
class _$HomeCategoriesModelCopyWithImpl<$Res, $Val extends HomeCategoriesModel>
    implements $HomeCategoriesModelCopyWith<$Res> {
  _$HomeCategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namevi = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeCategoriesModelCopyWith<$Res>
    implements $HomeCategoriesModelCopyWith<$Res> {
  factory _$$_HomeCategoriesModelCopyWith(_$_HomeCategoriesModel value,
          $Res Function(_$_HomeCategoriesModel) then) =
      __$$_HomeCategoriesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String namevi, String photo});
}

/// @nodoc
class __$$_HomeCategoriesModelCopyWithImpl<$Res>
    extends _$HomeCategoriesModelCopyWithImpl<$Res, _$_HomeCategoriesModel>
    implements _$$_HomeCategoriesModelCopyWith<$Res> {
  __$$_HomeCategoriesModelCopyWithImpl(_$_HomeCategoriesModel _value,
      $Res Function(_$_HomeCategoriesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namevi = null,
    Object? photo = null,
  }) {
    return _then(_$_HomeCategoriesModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeCategoriesModel
    with DiagnosticableTreeMixin
    implements _HomeCategoriesModel {
  const _$_HomeCategoriesModel(
      {required this.id, required this.namevi, required this.photo});

  factory _$_HomeCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeCategoriesModelFromJson(json);

  @override
  final String id;
  @override
  final String namevi;
  @override
  final String photo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeCategoriesModel(id: $id, namevi: $namevi, photo: $photo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeCategoriesModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('namevi', namevi))
      ..add(DiagnosticsProperty('photo', photo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeCategoriesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namevi, namevi) || other.namevi == namevi) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, namevi, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeCategoriesModelCopyWith<_$_HomeCategoriesModel> get copyWith =>
      __$$_HomeCategoriesModelCopyWithImpl<_$_HomeCategoriesModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeCategoriesModelToJson(
      this,
    );
  }
}

abstract class _HomeCategoriesModel implements HomeCategoriesModel {
  const factory _HomeCategoriesModel(
      {required final String id,
      required final String namevi,
      required final String photo}) = _$_HomeCategoriesModel;

  factory _HomeCategoriesModel.fromJson(Map<String, dynamic> json) =
      _$_HomeCategoriesModel.fromJson;

  @override
  String get id;
  @override
  String get namevi;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_HomeCategoriesModelCopyWith<_$_HomeCategoriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
