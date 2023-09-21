// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'cart_module_router.dart';

abstract class _$CartModuleRouter extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    CartListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartListPage(),
      );
    }
  };
}

/// generated route for
/// [CartListPage]
class CartListRoute extends PageRouteInfo<void> {
  const CartListRoute({List<PageRouteInfo>? children})
      : super(
          CartListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
