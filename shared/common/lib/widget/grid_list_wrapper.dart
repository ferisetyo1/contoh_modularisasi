// import 'package:core/core.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// import '../common.dart';

// class GridListWrapper<T, C extends StateStreamable<S>, S>
//     extends StatefulWidget {
//   final Function(PagingController<int, T> pagingController)?
//       setPagingController;
//   final Function(int page, C cubit) requestPage;
//   final String Function()? searchingQuery;
//   final ResponseHandler<BaseResponse<IList<T>>> Function(S state) respon;
//   final EdgeInsets? margin;
//   final bool? isReversed;
//   final Widget? separator;
//   final Function(BuildContext context, T item, int index,
//       PagingController<int, T> pagingController) itemWidget;
//   final Widget Function(BuildContext context)? firstLoadNewPage;
//   final String? name;
//   final SliverGridDelegate gridDelegate;
//   final Function(PagingController<int, T> pagingController)? addLastItem;
//   const GridListWrapper({
//     super.key,
//     required this.gridDelegate,
//     this.setPagingController,
//     required this.respon,
//     required this.requestPage,
//     this.margin,
//     this.isReversed,
//     required this.itemWidget,
//     this.separator,
//     this.firstLoadNewPage,
//     this.name,
//     this.searchingQuery,
//     this.addLastItem,
//   });

//   @override
//   State<GridListWrapper> createState() => _GridListWrapperState<T, C, S>();
// }

// class _GridListWrapperState<T, C extends StateStreamable<S>, S>
//     extends State<GridListWrapper<T, C, S>> {
//   final pagingController = PagingController<int, T>(firstPageKey: 1);

//   @override
//   void initState() {
//     pagingController.addPageRequestListener((pageKey) {
//       widget.requestPage(pageKey, context.read<C>());
//     });
//     widget.setPagingController?.call(pagingController);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     pagingController.dispose();
//     super.dispose();
//   }

//   String? get searchingQuery => widget.searchingQuery?.call();

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<C, S>(
//       listenWhen: (previous, current) =>
//           widget.respon(previous) != widget.respon(current),
//       listener: (context, state) {
//         widget.respon(state).maybeWhen(
//               orElse: () => null,
//               success: (data) {
//                 if (data?.nextPage == null) {
//                   pagingController.appendLastPage(data?.data?.toList() ?? []);
//                   widget.addLastItem?.call(pagingController);
//                 } else {
//                   pagingController.appendPage(data?.data?.toList() ?? [],
//                       (pagingController.nextPageKey ?? 1) + 1);
//                 }
//               },
//               error: (code, message) {
//                 pagingController.error = message;
//               },
//               noConnection: (data) {
//                 pagingController.error = "no_connection";
//               },
//             );
//       },
//       child: RefreshIndicator(
//         onRefresh: () async => pagingController.refresh(),
//         child: PagedGridView(
//           gridDelegate: widget.gridDelegate,
//           pagingController: pagingController,
//           padding: widget.margin ?? const EdgeInsets.all(24),
//           reverse: widget.isReversed ?? false,
//           builderDelegate: PagedChildBuilderDelegate<T>(
//             animateTransitions: true,
//             firstPageProgressIndicatorBuilder: widget.firstLoadNewPage,
//             itemBuilder: (context, item, index) =>
//                 widget.itemWidget(context, item, index, pagingController),
//             noItemsFoundIndicatorBuilder: (context) => Padding(
//               padding:
//                   EdgeInsets.zero == widget.margin || widget.margin?.left == 0
//                       ? const EdgeInsets.all(24)
//                       : EdgeInsets.zero,
//               child: GeneralError(
//                   customImg: SvgPicture.asset(ImageAssetPath.emptySearching),
//                   title:
//                       "Tidak ada ${widget.name.toTitleCase(emptyCase: "Item")}",
//                   subTitle:
//                       "Tidak menemukan ${widget.name ?? "item"} ${searchingQuery != null ? "dengan kata kunci '$searchingQuery'" : ""}",
//                   margin: const EdgeInsets.only(
//                     bottom: 100,
//                   )),
//             ),
//             firstPageErrorIndicatorBuilder: (context) {
//               if (pagingController.error == "no_connection") {
//                 return Padding(
//                   padding: EdgeInsets.zero == widget.margin ||
//                           widget.margin?.left == 0
//                       ? const EdgeInsets.all(24)
//                       : EdgeInsets.zero,
//                   child: GeneralError(
//                     title: "Tidak ada koneksi",
//                     subTitle: "Silahkan periksa koneksi handphone anda",
//                     margin: const EdgeInsets.only(bottom: 100),
//                     onTap: () {
//                       pagingController.refresh();
//                     },
//                   ),
//                 );
//               }
//               return Padding(
//                 padding:
//                     EdgeInsets.zero == widget.margin || widget.margin?.left == 0
//                         ? const EdgeInsets.all(24)
//                         : EdgeInsets.zero,
//                 child: GeneralError(
//                   subTitle: pagingController.error,
//                   margin: const EdgeInsets.only(bottom: 100),
//                   onTap: () {
//                     pagingController.refresh();
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
