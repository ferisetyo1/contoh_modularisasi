import 'package:core/core.dart';
import 'package:produk/infrastructure/infrastructure.dart';

abstract class IProdukRepository {
  Future<ResponseHandler<IList<Produk>>> fetchListProduk();
  Future<ResponseHandler<Produk>> fetchProduk(int id);
}
