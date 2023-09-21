import '../../core.dart';

class RequestHandler {
  final ConnectivityHelper _connectivity;
  final Dio _dio;
  RequestHandler(this._connectivity, this._dio);

  Future<ResponseHandler<T>> doRequest<T>(
      {required Future<Response<dynamic>> Function(Dio dio) request,
      required T Function(dynamic json) onMapping,
      Function(T?)? onSuccess}) async {
    try {
      final isConnected = await _connectivity.isConnected();
      if (!isConnected) {
        return const ResponseHandler.noConnection();
      }
      final resp = await request(_dio);
      final data = onMapping(resp.data);
      if (resp.statusCode == 200) {
        onSuccess?.call(data);
        return ResponseHandler.success(data);
      } else {
        AppConfig.logger.e(data);
        // return ResponseHandler.error(data.message);
        return const ResponseHandler.error("message error from API");
      }
    } on DioException catch (e) {
      // final resp = e.response;
      // if (resp != null) {
      //   if (resp.data is Map<String, dynamic>) {
      //     final json = resp.data as Map<String, dynamic>;
      // final data = BaseResponse.fromJson(json, (json) => json);
      //     AppConfig.logger.e(data);
      //     return ResponseHandler.error(data.code, data.message);
      //   }
      //   return ResponseHandler.error(
      //       e.response?.statusCode.toString(), e.message);
      // }
      AppConfig.logger.e(e);
      return ResponseHandler.error(e.message);
    } catch (e) {
      AppConfig.logger.e(e);
      return ResponseHandler.error(e.toString());
    }
  }
}
