part of 'produk_cubit.dart';

@freezed
class ProdukState with _$ProdukState {
  const factory ProdukState({
    required ResponseHandler<IList<Produk>> list,
    required ResponseHandler<Produk> detail,
  }) = _ProdukState;
  factory ProdukState.initial() => ProdukState(
      list: ResponseHandler.initial(), detail: ResponseHandler.initial());
}
