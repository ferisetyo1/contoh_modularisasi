part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({required ResponseHandler<CartDetail> detail}) =
      _CartState;
  factory CartState.initial() => CartState(detail: ResponseHandler.initial());
}
