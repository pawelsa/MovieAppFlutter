// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credits_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiCredits _$ApiCreditsFromJson(Map<String, dynamic> json) {
  return _ApiCredits.fromJson(json);
}

/// @nodoc
class _$ApiCreditsTearOff {
  const _$ApiCreditsTearOff();

  _ApiCredits call(
      {required int id,
      @ApiPersonConverter() required List<ApiPerson> cast,
      @ApiPersonConverter() required List<ApiPerson> crew}) {
    return _ApiCredits(
      id: id,
      cast: cast,
      crew: crew,
    );
  }

  ApiCredits fromJson(Map<String, Object?> json) {
    return ApiCredits.fromJson(json);
  }
}

/// @nodoc
const $ApiCredits = _$ApiCreditsTearOff();

/// @nodoc
mixin _$ApiCredits {
  int get id => throw _privateConstructorUsedError;
  @ApiPersonConverter()
  List<ApiPerson> get cast => throw _privateConstructorUsedError;
  @ApiPersonConverter()
  List<ApiPerson> get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiCreditsCopyWith<ApiCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCreditsCopyWith<$Res> {
  factory $ApiCreditsCopyWith(
          ApiCredits value, $Res Function(ApiCredits) then) =
      _$ApiCreditsCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @ApiPersonConverter() List<ApiPerson> cast,
      @ApiPersonConverter() List<ApiPerson> crew});
}

/// @nodoc
class _$ApiCreditsCopyWithImpl<$Res> implements $ApiCreditsCopyWith<$Res> {
  _$ApiCreditsCopyWithImpl(this._value, this._then);

  final ApiCredits _value;
  // ignore: unused_field
  final $Res Function(ApiCredits) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: cast == freezed
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<ApiPerson>,
      crew: crew == freezed
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<ApiPerson>,
    ));
  }
}

/// @nodoc
abstract class _$ApiCreditsCopyWith<$Res> implements $ApiCreditsCopyWith<$Res> {
  factory _$ApiCreditsCopyWith(
          _ApiCredits value, $Res Function(_ApiCredits) then) =
      __$ApiCreditsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @ApiPersonConverter() List<ApiPerson> cast,
      @ApiPersonConverter() List<ApiPerson> crew});
}

/// @nodoc
class __$ApiCreditsCopyWithImpl<$Res> extends _$ApiCreditsCopyWithImpl<$Res>
    implements _$ApiCreditsCopyWith<$Res> {
  __$ApiCreditsCopyWithImpl(
      _ApiCredits _value, $Res Function(_ApiCredits) _then)
      : super(_value, (v) => _then(v as _ApiCredits));

  @override
  _ApiCredits get _value => super._value as _ApiCredits;

  @override
  $Res call({
    Object? id = freezed,
    Object? cast = freezed,
    Object? crew = freezed,
  }) {
    return _then(_ApiCredits(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: cast == freezed
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<ApiPerson>,
      crew: crew == freezed
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<ApiPerson>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ApiCredits implements _ApiCredits {
  _$_ApiCredits(
      {required this.id,
      @ApiPersonConverter() required this.cast,
      @ApiPersonConverter() required this.crew});

  factory _$_ApiCredits.fromJson(Map<String, dynamic> json) =>
      _$$_ApiCreditsFromJson(json);

  @override
  final int id;
  @override
  @ApiPersonConverter()
  final List<ApiPerson> cast;
  @override
  @ApiPersonConverter()
  final List<ApiPerson> crew;

  @override
  String toString() {
    return 'ApiCredits(id: $id, cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiCredits &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.cast, cast) &&
            const DeepCollectionEquality().equals(other.crew, crew));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(cast),
      const DeepCollectionEquality().hash(crew));

  @JsonKey(ignore: true)
  @override
  _$ApiCreditsCopyWith<_ApiCredits> get copyWith =>
      __$ApiCreditsCopyWithImpl<_ApiCredits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiCreditsToJson(this);
  }
}

abstract class _ApiCredits implements ApiCredits {
  factory _ApiCredits(
      {required int id,
      @ApiPersonConverter() required List<ApiPerson> cast,
      @ApiPersonConverter() required List<ApiPerson> crew}) = _$_ApiCredits;

  factory _ApiCredits.fromJson(Map<String, dynamic> json) =
      _$_ApiCredits.fromJson;

  @override
  int get id;
  @override
  @ApiPersonConverter()
  List<ApiPerson> get cast;
  @override
  @ApiPersonConverter()
  List<ApiPerson> get crew;
  @override
  @JsonKey(ignore: true)
  _$ApiCreditsCopyWith<_ApiCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiPerson _$ApiPersonFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _ApiPerson.fromJson(json);
    case 'empty':
      return _ApiPersonEmpty.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ApiPerson',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$ApiPersonTearOff {
  const _$ApiPersonTearOff();

  _ApiPerson call(
      {required int id,
      required String name,
      @JsonKey(name: "profile_path") required String? profilePath,
      required String? character,
      required int? order,
      required String? department,
      required String? job,
      @JsonKey(name: "credit_id") required String creditId}) {
    return _ApiPerson(
      id: id,
      name: name,
      profilePath: profilePath,
      character: character,
      order: order,
      department: department,
      job: job,
      creditId: creditId,
    );
  }

  _ApiPersonEmpty empty(
      [int id = -1,
      String name = "Unknown",
      @JsonKey(name: "profile_path") String? profilePath = null,
      String? character = null,
      int? order = -1,
      String? department = null,
      String? job = null,
      @JsonKey(name: "credit_id") String creditId = ""]) {
    return _ApiPersonEmpty(
      id,
      name,
      profilePath,
      character,
      order,
      department,
      job,
      creditId,
    );
  }

  ApiPerson fromJson(Map<String, Object?> json) {
    return ApiPerson.fromJson(json);
  }
}

/// @nodoc
const $ApiPerson = _$ApiPersonTearOff();

/// @nodoc
mixin _$ApiPerson {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_path")
  String? get profilePath => throw _privateConstructorUsedError;
  String? get character => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  @JsonKey(name: "credit_id")
  String get creditId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        $default, {
    required TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiPerson value) $default, {
    required TResult Function(_ApiPersonEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiPersonCopyWith<ApiPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiPersonCopyWith<$Res> {
  factory $ApiPersonCopyWith(ApiPerson value, $Res Function(ApiPerson) then) =
      _$ApiPersonCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "profile_path") String? profilePath,
      String? character,
      int? order,
      String? department,
      String? job,
      @JsonKey(name: "credit_id") String creditId});
}

/// @nodoc
class _$ApiPersonCopyWithImpl<$Res> implements $ApiPersonCopyWith<$Res> {
  _$ApiPersonCopyWithImpl(this._value, this._then);

  final ApiPerson _value;
  // ignore: unused_field
  final $Res Function(ApiPerson) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profilePath = freezed,
    Object? character = freezed,
    Object? order = freezed,
    Object? department = freezed,
    Object? job = freezed,
    Object? creditId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: profilePath == freezed
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      character: character == freezed
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      department: department == freezed
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      job: job == freezed
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: creditId == freezed
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApiPersonCopyWith<$Res> implements $ApiPersonCopyWith<$Res> {
  factory _$ApiPersonCopyWith(
          _ApiPerson value, $Res Function(_ApiPerson) then) =
      __$ApiPersonCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "profile_path") String? profilePath,
      String? character,
      int? order,
      String? department,
      String? job,
      @JsonKey(name: "credit_id") String creditId});
}

/// @nodoc
class __$ApiPersonCopyWithImpl<$Res> extends _$ApiPersonCopyWithImpl<$Res>
    implements _$ApiPersonCopyWith<$Res> {
  __$ApiPersonCopyWithImpl(_ApiPerson _value, $Res Function(_ApiPerson) _then)
      : super(_value, (v) => _then(v as _ApiPerson));

  @override
  _ApiPerson get _value => super._value as _ApiPerson;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profilePath = freezed,
    Object? character = freezed,
    Object? order = freezed,
    Object? department = freezed,
    Object? job = freezed,
    Object? creditId = freezed,
  }) {
    return _then(_ApiPerson(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: profilePath == freezed
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      character: character == freezed
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      department: department == freezed
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      job: job == freezed
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: creditId == freezed
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ApiPerson implements _ApiPerson {
  _$_ApiPerson(
      {required this.id,
      required this.name,
      @JsonKey(name: "profile_path") required this.profilePath,
      required this.character,
      required this.order,
      required this.department,
      required this.job,
      @JsonKey(name: "credit_id") required this.creditId,
      String? $type})
      : $type = $type ?? 'default';

  factory _$_ApiPerson.fromJson(Map<String, dynamic> json) =>
      _$$_ApiPersonFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @override
  final String? character;
  @override
  final int? order;
  @override
  final String? department;
  @override
  final String? job;
  @override
  @JsonKey(name: "credit_id")
  final String creditId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiPerson(id: $id, name: $name, profilePath: $profilePath, character: $character, order: $order, department: $department, job: $job, creditId: $creditId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiPerson &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profilePath, profilePath) &&
            const DeepCollectionEquality().equals(other.character, character) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality()
                .equals(other.department, department) &&
            const DeepCollectionEquality().equals(other.job, job) &&
            const DeepCollectionEquality().equals(other.creditId, creditId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profilePath),
      const DeepCollectionEquality().hash(character),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(department),
      const DeepCollectionEquality().hash(job),
      const DeepCollectionEquality().hash(creditId));

  @JsonKey(ignore: true)
  @override
  _$ApiPersonCopyWith<_ApiPerson> get copyWith =>
      __$ApiPersonCopyWithImpl<_ApiPerson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        $default, {
    required TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        empty,
  }) {
    return $default(
        id, name, profilePath, character, order, department, job, creditId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
  }) {
    return $default?.call(
        id, name, profilePath, character, order, department, job, creditId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id, name, profilePath, character, order, department, job, creditId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiPerson value) $default, {
    required TResult Function(_ApiPersonEmpty value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiPersonToJson(this);
  }
}

abstract class _ApiPerson implements ApiPerson {
  factory _ApiPerson(
      {required int id,
      required String name,
      @JsonKey(name: "profile_path") required String? profilePath,
      required String? character,
      required int? order,
      required String? department,
      required String? job,
      @JsonKey(name: "credit_id") required String creditId}) = _$_ApiPerson;

  factory _ApiPerson.fromJson(Map<String, dynamic> json) =
      _$_ApiPerson.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "profile_path")
  String? get profilePath;
  @override
  String? get character;
  @override
  int? get order;
  @override
  String? get department;
  @override
  String? get job;
  @override
  @JsonKey(name: "credit_id")
  String get creditId;
  @override
  @JsonKey(ignore: true)
  _$ApiPersonCopyWith<_ApiPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ApiPersonEmptyCopyWith<$Res>
    implements $ApiPersonCopyWith<$Res> {
  factory _$ApiPersonEmptyCopyWith(
          _ApiPersonEmpty value, $Res Function(_ApiPersonEmpty) then) =
      __$ApiPersonEmptyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      @JsonKey(name: "profile_path") String? profilePath,
      String? character,
      int? order,
      String? department,
      String? job,
      @JsonKey(name: "credit_id") String creditId});
}

/// @nodoc
class __$ApiPersonEmptyCopyWithImpl<$Res> extends _$ApiPersonCopyWithImpl<$Res>
    implements _$ApiPersonEmptyCopyWith<$Res> {
  __$ApiPersonEmptyCopyWithImpl(
      _ApiPersonEmpty _value, $Res Function(_ApiPersonEmpty) _then)
      : super(_value, (v) => _then(v as _ApiPersonEmpty));

  @override
  _ApiPersonEmpty get _value => super._value as _ApiPersonEmpty;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? profilePath = freezed,
    Object? character = freezed,
    Object? order = freezed,
    Object? department = freezed,
    Object? job = freezed,
    Object? creditId = freezed,
  }) {
    return _then(_ApiPersonEmpty(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath == freezed
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      character == freezed
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      department == freezed
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      job == freezed
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId == freezed
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ApiPersonEmpty implements _ApiPersonEmpty {
  _$_ApiPersonEmpty(
      [this.id = -1,
      this.name = "Unknown",
      @JsonKey(name: "profile_path") this.profilePath = null,
      this.character = null,
      this.order = -1,
      this.department = null,
      this.job = null,
      @JsonKey(name: "credit_id") this.creditId = "",
      String? $type])
      : $type = $type ?? 'empty';

  factory _$_ApiPersonEmpty.fromJson(Map<String, dynamic> json) =>
      _$$_ApiPersonEmptyFromJson(json);

  @JsonKey()
  @override
  final int id;
  @JsonKey()
  @override
  final String name;
  @override
  @JsonKey(name: "profile_path")
  final String? profilePath;
  @JsonKey()
  @override
  final String? character;
  @JsonKey()
  @override
  final int? order;
  @JsonKey()
  @override
  final String? department;
  @JsonKey()
  @override
  final String? job;
  @override
  @JsonKey(name: "credit_id")
  final String creditId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ApiPerson.empty(id: $id, name: $name, profilePath: $profilePath, character: $character, order: $order, department: $department, job: $job, creditId: $creditId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiPersonEmpty &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.profilePath, profilePath) &&
            const DeepCollectionEquality().equals(other.character, character) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality()
                .equals(other.department, department) &&
            const DeepCollectionEquality().equals(other.job, job) &&
            const DeepCollectionEquality().equals(other.creditId, creditId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(profilePath),
      const DeepCollectionEquality().hash(character),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(department),
      const DeepCollectionEquality().hash(job),
      const DeepCollectionEquality().hash(creditId));

  @JsonKey(ignore: true)
  @override
  _$ApiPersonEmptyCopyWith<_ApiPersonEmpty> get copyWith =>
      __$ApiPersonEmptyCopyWithImpl<_ApiPersonEmpty>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        $default, {
    required TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)
        empty,
  }) {
    return empty(
        id, name, profilePath, character, order, department, job, creditId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
  }) {
    return empty?.call(
        id, name, profilePath, character, order, department, job, creditId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        $default, {
    TResult Function(
            int id,
            String name,
            @JsonKey(name: "profile_path") String? profilePath,
            String? character,
            int? order,
            String? department,
            String? job,
            @JsonKey(name: "credit_id") String creditId)?
        empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(
          id, name, profilePath, character, order, department, job, creditId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ApiPerson value) $default, {
    required TResult Function(_ApiPersonEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ApiPerson value)? $default, {
    TResult Function(_ApiPersonEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiPersonEmptyToJson(this);
  }
}

abstract class _ApiPersonEmpty implements ApiPerson {
  factory _ApiPersonEmpty(
      [int id,
      String name,
      @JsonKey(name: "profile_path") String? profilePath,
      String? character,
      int? order,
      String? department,
      String? job,
      @JsonKey(name: "credit_id") String creditId]) = _$_ApiPersonEmpty;

  factory _ApiPersonEmpty.fromJson(Map<String, dynamic> json) =
      _$_ApiPersonEmpty.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: "profile_path")
  String? get profilePath;
  @override
  String? get character;
  @override
  int? get order;
  @override
  String? get department;
  @override
  String? get job;
  @override
  @JsonKey(name: "credit_id")
  String get creditId;
  @override
  @JsonKey(ignore: true)
  _$ApiPersonEmptyCopyWith<_ApiPersonEmpty> get copyWith =>
      throw _privateConstructorUsedError;
}
