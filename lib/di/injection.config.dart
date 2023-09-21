// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cart/cart.dart' as _i5;
import 'package:core/core.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:produk/produk.dart' as _i6;

import '../router/router.dart' as _i3;
import 'feature_module.dart' as _i8;
import 'main_module.dart' as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final mainModule = _$MainModule();
  final featureModule = _$FeatureModule(getIt);
  gh.lazySingleton<_i3.AppRouters>(() => mainModule.appRouters);
  gh.lazySingleton<_i4.Box<dynamic>>(() => mainModule.hiveBox());
  gh.lazySingleton<_i4.Connectivity>(() => featureModule.connectify);
  gh.lazySingleton<_i4.ConnectivityHelper>(
      () => featureModule.connectifyHelper);
  gh.lazySingleton<_i4.HiveHelper>(() => featureModule.hiveHelper);
  gh.lazySingleton<_i4.Alice>(() => mainModule.alice(gh<_i3.AppRouters>()));
  await gh.lazySingletonAsync<_i4.Dio>(
    () => mainModule.dio(
      gh<_i4.Alice>(),
      gh<_i4.HiveHelper>(),
    ),
    preResolve: true,
  );
  gh.lazySingleton<_i4.RequestHandler>(() => featureModule.requestHandler);
  gh.lazySingleton<_i5.ICartRepository>(() => featureModule.cartRepository);
  gh.lazySingleton<_i6.IProdukRepository>(() => featureModule.produkRepository);
  gh.factory<_i6.ProdukCubit>(() => featureModule.produk);
  gh.factory<_i5.CartCubit>(() => featureModule.cart);
  return getIt;
}

class _$MainModule extends _i7.MainModule {
  @override
  _i3.AppRouters get appRouters => _i3.AppRouters();
}

class _$FeatureModule extends _i8.FeatureModule {
  _$FeatureModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.Connectivity get connectify => _i4.Connectivity();
  @override
  _i4.ConnectivityHelper get connectifyHelper =>
      _i4.ConnectivityHelper(_getIt<_i4.Connectivity>());
  @override
  _i4.HiveHelper get hiveHelper => _i4.HiveHelper(_getIt<_i4.Box<dynamic>>());
  @override
  _i4.RequestHandler get requestHandler => _i4.RequestHandler(
        _getIt<_i4.ConnectivityHelper>(),
        _getIt<_i4.Dio>(),
      );
  @override
  _i5.CartRepository get cartRepository =>
      _i5.CartRepository(_getIt<_i4.RequestHandler>());
  @override
  _i6.ProdukRepository get produkRepository =>
      _i6.ProdukRepository(_getIt<_i4.RequestHandler>());
  @override
  _i6.ProdukCubit get produk =>
      _i6.ProdukCubit(_getIt<_i6.IProdukRepository>());
  @override
  _i5.CartCubit get cart => _i5.CartCubit(_getIt<_i5.ICartRepository>());
}
