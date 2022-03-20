import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class ErrorCause with _$ErrorCause {
  const factory ErrorCause.noInternet() = NoInternetError;

  const factory ErrorCause.databaseSave() = DatabaseSaveError;

  const factory ErrorCause.unknown() = UnknownError;
}

@freezed
class Result with _$Result {
  const factory Result.success() = SuccessfulResult;

  const factory Result.error(ErrorCause error) = ErrorResult;
}

@freezed
class DataResult<T> with _$DataResult<T> {
  const factory DataResult.success(T data) = SuccessfulDataResult<T>;

  const factory DataResult.error(T data, ErrorCause error) = ErrorDataResult<T>;
}

