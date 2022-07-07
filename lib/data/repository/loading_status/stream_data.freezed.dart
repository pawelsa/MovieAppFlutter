// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stream_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StreamDataTearOff {
  const _$StreamDataTearOff();

  ReadyData<T> ready<T>(T data) {
    return ReadyData<T>(
      data,
    );
  }

  LoadingData<T> loading<T>(T data) {
    return LoadingData<T>(
      data,
    );
  }
}

/// @nodoc
const $StreamData = _$StreamDataTearOff();

/// @nodoc
mixin _$StreamData<T> {
  T get data => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) ready,
    required TResult Function(T data) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReadyData<T> value) ready,
    required TResult Function(LoadingData<T> value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamDataCopyWith<T, StreamData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamDataCopyWith<T, $Res> {
  factory $StreamDataCopyWith(
          StreamData<T> value, $Res Function(StreamData<T>) then) =
      _$StreamDataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$StreamDataCopyWithImpl<T, $Res>
    implements $StreamDataCopyWith<T, $Res> {
  _$StreamDataCopyWithImpl(this._value, this._then);

  final StreamData<T> _value;
  // ignore: unused_field
  final $Res Function(StreamData<T>) _then;

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
abstract class $ReadyDataCopyWith<T, $Res>
    implements $StreamDataCopyWith<T, $Res> {
  factory $ReadyDataCopyWith(
          ReadyData<T> value, $Res Function(ReadyData<T>) then) =
      _$ReadyDataCopyWithImpl<T, $Res>;
  @override
  $Res call({T data});
}

/// @nodoc
class _$ReadyDataCopyWithImpl<T, $Res> extends _$StreamDataCopyWithImpl<T, $Res>
    implements $ReadyDataCopyWith<T, $Res> {
  _$ReadyDataCopyWithImpl(
      ReadyData<T> _value, $Res Function(ReadyData<T>) _then)
      : super(_value, (v) => _then(v as ReadyData<T>));

  @override
  ReadyData<T> get _value => super._value as ReadyData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(ReadyData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ReadyData<T> implements ReadyData<T> {
  _$ReadyData(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'StreamData<$T>.ready(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReadyData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $ReadyDataCopyWith<T, ReadyData<T>> get copyWith =>
      _$ReadyDataCopyWithImpl<T, ReadyData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) ready,
    required TResult Function(T data) loading,
  }) {
    return ready(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
  }) {
    return ready?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReadyData<T> value) ready,
    required TResult Function(LoadingData<T> value) loading,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ReadyData<T> implements StreamData<T> {
  factory ReadyData(T data) = _$ReadyData<T>;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  $ReadyDataCopyWith<T, ReadyData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingDataCopyWith<T, $Res>
    implements $StreamDataCopyWith<T, $Res> {
  factory $LoadingDataCopyWith(
          LoadingData<T> value, $Res Function(LoadingData<T>) then) =
      _$LoadingDataCopyWithImpl<T, $Res>;
  @override
  $Res call({T data});
}

/// @nodoc
class _$LoadingDataCopyWithImpl<T, $Res>
    extends _$StreamDataCopyWithImpl<T, $Res>
    implements $LoadingDataCopyWith<T, $Res> {
  _$LoadingDataCopyWithImpl(
      LoadingData<T> _value, $Res Function(LoadingData<T>) _then)
      : super(_value, (v) => _then(v as LoadingData<T>));

  @override
  LoadingData<T> get _value => super._value as LoadingData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(LoadingData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadingData<T> implements LoadingData<T> {
  _$LoadingData(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'StreamData<$T>.loading(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadingData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $LoadingDataCopyWith<T, LoadingData<T>> get copyWith =>
      _$LoadingDataCopyWithImpl<T, LoadingData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) ready,
    required TResult Function(T data) loading,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? ready,
    TResult Function(T data)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReadyData<T> value) ready,
    required TResult Function(LoadingData<T> value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReadyData<T> value)? ready,
    TResult Function(LoadingData<T> value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingData<T> implements StreamData<T> {
  factory LoadingData(T data) = _$LoadingData<T>;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  $LoadingDataCopyWith<T, LoadingData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
