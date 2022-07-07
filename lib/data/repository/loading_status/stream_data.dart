import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_data.freezed.dart';

@freezed
class StreamData<T> with _$StreamData<T> {
  factory StreamData.ready(T data) = ReadyData<T>;
  factory StreamData.loading(T data) = LoadingData<T>;
}

typedef DataStream<T> = Stream<StreamData<T>>;