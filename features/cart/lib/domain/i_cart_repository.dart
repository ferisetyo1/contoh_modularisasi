import 'package:cart/cart.dart';
import 'package:core/core.dart';

abstract class ICartRepository {
  Future<ResponseHandler<CartDetail>> fetchCart();
}
