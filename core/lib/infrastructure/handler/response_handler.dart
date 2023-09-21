import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_handler.freezed.dart';

@freezed
class ResponseHandler<T> with _$ResponseHandler<T> {
  const factory ResponseHandler.initial() = _Initial;
  const factory ResponseHandler.loading() = _Loading;
  const factory ResponseHandler.noConnection({T? data}) = _NoConnection;
  const factory ResponseHandler.success(T? data) = _Success;
  const factory ResponseHandler.error(String? message) = _Error;
}

extension ResponsesExt<T> on ResponseHandler<T> {
  T? getData() => maybeWhen(orElse: () => null, success: (data) => data);
  String? getMessage() => maybeWhen(orElse: () => null, error: (msg) => msg);
  bool isLoading() => maybeWhen(orElse: () => false, loading: () => true);
  bool isInitial() => maybeWhen(orElse: () => false, initial: () => true);
  bool isError() => maybeWhen(orElse: () => false, error: (_) => true);
  bool isSuccess() => maybeWhen(orElse: () => false, success: (_) => true);
}
