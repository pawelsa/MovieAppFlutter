// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  SuccessfulResult success() {
    return const SuccessfulResult();
  }

  ErrorResult error(dynamic error) {
    return ErrorResult(
      error,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulResult value) success,
    required TResult Function(ErrorResult value) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) = _$ResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res> implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result _value;

  // ignore: unused_field
  final $Res Function(Result) _then;
}

/// @nodoc
abstract class $SuccessfulResultCopyWith<$Res> {
  factory $SuccessfulResultCopyWith(SuccessfulResult value, $Res Function(SuccessfulResult) then) =
      _$SuccessfulResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessfulResultCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res>
    implements $SuccessfulResultCopyWith<$Res> {
  _$SuccessfulResultCopyWithImpl(SuccessfulResult _value, $Res Function(SuccessfulResult) _then)
      : super(_value, (v) => _then(v as SuccessfulResult));

  @override
  SuccessfulResult get _value => super._value as SuccessfulResult;
}

/// @nodoc

class _$SuccessfulResult implements SuccessfulResult {
  const _$SuccessfulResult();

  @override
  String toString() {
    return 'Result.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SuccessfulResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(dynamic error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulResult value) success,
    required TResult Function(ErrorResult value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessfulResult implements Result {
  const factory SuccessfulResult() = _$SuccessfulResult;
}

/// @nodoc
abstract class $ErrorResultCopyWith<$Res> {
  factory $ErrorResultCopyWith(ErrorResult value, $Res Function(ErrorResult) then) = _$ErrorResultCopyWithImpl<$Res>;

  $Res call({dynamic error});
}

/// @nodoc
class _$ErrorResultCopyWithImpl<$Res> extends _$ResultCopyWithImpl<$Res> implements $ErrorResultCopyWith<$Res> {
  _$ErrorResultCopyWithImpl(ErrorResult _value, $Res Function(ErrorResult) _then)
      : super(_value, (v) => _then(v as ErrorResult));

  @override
  ErrorResult get _value => super._value as ErrorResult;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ErrorResult(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ErrorResult implements ErrorResult {
  const _$ErrorResult(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'Result.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorResult &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ErrorResultCopyWith<ErrorResult> get copyWith => _$ErrorResultCopyWithImpl<ErrorResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulResult value) success,
    required TResult Function(ErrorResult value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulResult value)? success,
    TResult Function(ErrorResult value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorResult implements Result {
  const factory ErrorResult(dynamic error) = _$ErrorResult;

  dynamic get error;

  @JsonKey(ignore: true)
  $ErrorResultCopyWith<ErrorResult> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$DataResultTearOff {
  const _$DataResultTearOff();

  SuccessfulDataResult<T> success<T>(T data) {
    return SuccessfulDataResult<T>(
      data,
    );
  }

  ErrorDataResult<T> error<T>(T data, dynamic error) {
    return ErrorDataResult<T>(
      data,
      error,
    );
  }
}

/// @nodoc
const $DataResult = _$DataResultTearOff();

/// @nodoc
mixin _$DataResult<T> {
  T get data => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data, dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResult<T> value) success,
    required TResult Function(ErrorDataResult<T> value) error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataResultCopyWith<T, DataResult<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResultCopyWith<T, $Res> {
  factory $DataResultCopyWith(DataResult<T> value, $Res Function(DataResult<T>) then) =
      _$DataResultCopyWithImpl<T, $Res>;

  $Res call({T data});
}

/// @nodoc
class _$DataResultCopyWithImpl<T, $Res> implements $DataResultCopyWith<T, $Res> {
  _$DataResultCopyWithImpl(this._value, this._then);

  final DataResult<T> _value;

  // ignore: unused_field
  final $Res Function(DataResult<T>) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $SuccessfulDataResultCopyWith<T, $Res> implements $DataResultCopyWith<T, $Res> {
  factory $SuccessfulDataResultCopyWith(SuccessfulDataResult<T> value, $Res Function(SuccessfulDataResult<T>) then) =
      _$SuccessfulDataResultCopyWithImpl<T, $Res>;

  @override
  $Res call({T data});
}

/// @nodoc
class _$SuccessfulDataResultCopyWithImpl<T, $Res> extends _$DataResultCopyWithImpl<T, $Res>
    implements $SuccessfulDataResultCopyWith<T, $Res> {
  _$SuccessfulDataResultCopyWithImpl(SuccessfulDataResult<T> _value, $Res Function(SuccessfulDataResult<T>) _then)
      : super(_value, (v) => _then(v as SuccessfulDataResult<T>));

  @override
  SuccessfulDataResult<T> get _value => super._value as SuccessfulDataResult<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(SuccessfulDataResult<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

@Implements<SuccessfulResult>()
class _$SuccessfulDataResult<T> implements SuccessfulDataResult<T> {
  const _$SuccessfulDataResult(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DataResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SuccessfulDataResult<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $SuccessfulDataResultCopyWith<T, SuccessfulDataResult<T>> get copyWith =>
      _$SuccessfulDataResultCopyWithImpl<T, SuccessfulDataResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data, dynamic error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResult<T> value) success,
    required TResult Function(ErrorDataResult<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessfulDataResult<T> implements DataResult<T>, dynamic {
  const factory SuccessfulDataResult(T data) = _$SuccessfulDataResult<T>;

  @override
  T get data;

  @override
  @JsonKey(ignore: true)
  $SuccessfulDataResultCopyWith<T, SuccessfulDataResult<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorDataResultCopyWith<T, $Res> implements $DataResultCopyWith<T, $Res> {
  factory $ErrorDataResultCopyWith(ErrorDataResult<T> value, $Res Function(ErrorDataResult<T>) then) =
      _$ErrorDataResultCopyWithImpl<T, $Res>;

  @override
  $Res call({T data, dynamic error});
}

/// @nodoc
class _$ErrorDataResultCopyWithImpl<T, $Res> extends _$DataResultCopyWithImpl<T, $Res>
    implements $ErrorDataResultCopyWith<T, $Res> {
  _$ErrorDataResultCopyWithImpl(ErrorDataResult<T> _value, $Res Function(ErrorDataResult<T>) _then)
      : super(_value, (v) => _then(v as ErrorDataResult<T>));

  @override
  ErrorDataResult<T> get _value => super._value as ErrorDataResult<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(ErrorDataResult<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@Implements<ErrorResult>()
class _$ErrorDataResult<T> implements ErrorDataResult<T> {
  const _$ErrorDataResult(this.data, this.error);

  @override
  final T data;
  @override
  final dynamic error;

  @override
  String toString() {
    return 'DataResult<$T>.error(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorDataResult<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $ErrorDataResultCopyWith<T, ErrorDataResult<T>> get copyWith =>
      _$ErrorDataResultCopyWithImpl<T, ErrorDataResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(T data, dynamic error) error,
  }) {
    return error(data, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
  }) {
    return error?.call(data, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(T data, dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessfulDataResult<T> value) success,
    required TResult Function(ErrorDataResult<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessfulDataResult<T> value)? success,
    TResult Function(ErrorDataResult<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDataResult<T> implements DataResult<T>, dynamic {
  const factory ErrorDataResult(T data, dynamic error) = _$ErrorDataResult<T>;

  @override
  T get data;

  dynamic get error;

  @override
  @JsonKey(ignore: true)
  $ErrorDataResultCopyWith<T, ErrorDataResult<T>> get copyWith => throw _privateConstructorUsedError;
}