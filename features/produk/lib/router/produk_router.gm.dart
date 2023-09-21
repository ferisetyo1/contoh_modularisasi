// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'produk_router.dart';

abstract class _$ProdukModuleRouter extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    ProdukDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProdukDetailRouteArgs>(
          orElse: () => ProdukDetailRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProdukDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ProdukListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProdukListPage(),
      );
    },
  };
}

/// generated route for
/// [ProdukDetailPage]
class ProdukDetailRoute extends PageRouteInfo<ProdukDetailRouteArgs> {
  ProdukDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ProdukDetailRoute.name,
          args: ProdukDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ProdukDetailRoute';

  static const PageInfo<ProdukDetailRouteArgs> page =
      PageInfo<ProdukDetailRouteArgs>(name);
}

class ProdukDetailRouteArgs {
  const ProdukDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'ProdukDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ProdukListPage]
class ProdukListRoute extends PageRouteInfo<void> {
  const ProdukListRoute({List<PageRouteInfo>? children})
      : super(
          ProdukListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProdukListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
