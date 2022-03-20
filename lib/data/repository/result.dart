import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result.success() = SuccessfulResult;

  const factory Result.error(dynamic error) = ErrorResult;
}

@freezed
class DataResult<T> with _$DataResult<T> {
  @Implements<SuccessfulResult>()
  const factory DataResult.success(T data) = SuccessfulDataResult<T>;

  @Implements<ErrorResult>()
  const factory DataResult.error(T data, dynamic error) = ErrorDataResult<T>;
}
