import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:produk/produk.dart';

@module
abstract class FeatureModule {
  @lazySingleton
  Connectivity get connectify;

  @lazySingleton
  ConnectivityHelper get connectifyHelper;

  @lazySingleton
  RequestHandler get requestHandler;

  @lazySingleton
  HiveHelper get hiveHelper;

  //cart
  @LazySingleton(as: ICartRepository)
  CartRepository get cartRepository;

  @injectable
  CartCubit get cart;

  //produk
  @LazySingleton(as: IProdukRepository)
  ProdukRepository get produkRepository;

  @injectable
  ProdukCubit get produk;
}
