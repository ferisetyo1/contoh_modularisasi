import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:produk/produk.dart';

part 'produk_state.dart';
part 'produk_cubit.freezed.dart';

class ProdukCubit extends Cubit<ProdukState> {
  final IProdukRepository produkRepository;
  ProdukCubit(this.produkRepository) : super(ProdukState.initial());

  fetchList() async {
    emit(state.copyWith(list: ResponseHandler.loading()));
    final resp = await produkRepository.fetchListProduk();
    emit(state.copyWith(list: resp));
  }

  fetchDetail(int id) async {
    emit(state.copyWith(detail: ResponseHandler.loading()));
    final resp = await produkRepository.fetchProduk(id);
    emit(state.copyWith(detail: resp));
  }
}
