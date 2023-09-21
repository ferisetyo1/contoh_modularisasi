import 'package:bloc/bloc.dart';
import 'package:cart/domain/i_cart_repository.dart';
import 'package:cart/infrastructure/infrastructure.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final ICartRepository _repository;
  CartCubit(this._repository) : super(CartState.initial());

  fetchCarts() async {
    emit(state.copyWith(detail: ResponseHandler.loading()));
    final resp = await _repository.fetchCart();
    emit(state.copyWith(detail: resp));
  }
}
