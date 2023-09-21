import 'dart:io';

import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:produk/produk.dart';
import 'package:auto_route/auto_route.dart';

part 'app_routers.gr.dart';

@AutoRouterConfig(
  modules: [ProdukModuleRouter, CartModuleRouter],
)
class AppRouters extends _$AppRouters {
  @override
  RouteType get defaultRouteType => Platform.isAndroid
      ? const RouteType.material()
      : const RouteType.cupertino(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/produks", page: ProdukListRoute.page, initial: true),
        AutoRoute(path: "/produk/:id", page: ProdukDetailRoute.page),
        AutoRoute(path: "/carts", page: CartListRoute.page),
      ];
}
