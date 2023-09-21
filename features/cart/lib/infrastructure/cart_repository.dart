import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:core/infrastructure/handler/response_handler.dart';

class CartRepository extends ICartRepository {
  final RequestHandler _handler;
  CartRepository(this._handler);
  @override
  Future<ResponseHandler<CartDetail>> fetchCart() {
    return _handler.doRequest(
      request: (dio) => dio.get("650ba94ace39bb6dce7fc58e"),
      onMapping: (json) {
        final data =
            BaseResponse.fromJson(json, (json) => CartDetail.fromJson(json));
        return data.record ?? CartDetail();
      },
    );
  }
}
