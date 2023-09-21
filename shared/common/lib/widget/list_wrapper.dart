// import 'package:core/core.dart';
// import 'package:flutter/material.dart';

// import '../common.dart';

// class ListWrapper<T, C extends StateStreamable<S>, S> extends StatefulWidget {
//   final PagingController<int, T>? pagingController;
//   final Function(PagingController<int, T> pagingController)?
//       setPagingController;
//   final Function(int page, C cubit) requestPage;
//   final String Function()? searchingQuery;
//   final ResponseHandler<BaseResponse<IList<T>>> Function(S state) respon;
//   final EdgeInsets? margin;
//   final bool? isReversed;
//   final Function(PagingController<int, T> pagingController)? addLastItem;
//   final Widget? separator;
//   final Widget? Function(int index)? separatorBuilder;
//   final Function(BuildContext context, T item, int index,
//       PagingController<int, T> pagingController) itemWidget;
//   final Widget Function(BuildContext context)? firstLoadNewPage;
//   final String? name;
//   final bool shrinkWrap;
//   final ScrollController? scrollController;
//   final ScrollPhysics? physics;
//   final bool isPaginate;
//   final bool dispose;
//   const ListWrapper({
//     super.key,
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
//     this.shrinkWrap = false,
//     this.scrollController,
//     this.isPaginate = true,
//     this.physics,
//     this.pagingController,
//     this.dispose = true,
//     this.separatorBuilder,
//     this.addLastItem,
//   });

//   @override
//   State<ListWrapper> createState() => _ListWrapperState<T, C, S>();
// }

// class _ListWrapperState<T, C extends StateStreamable<S>, S>
//     extends State<ListWrapper<T, C, S>> {
//   late PagingController<int, T> pagingController;

//   @override
//   void initState() {
//     pagingController =
//         widget.pagingController ?? PagingController<int, T>(firstPageKey: 1);
//     pagingController.addPageRequestListener((pageKey) {
//       widget.requestPage(pageKey, context.read<C>());
//     });
//     widget.setPagingController?.call(pagingController);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     if (widget.dispose) {
//       pagingController.dispose();
//     }
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
//                 if (widget.isPaginate) {
//                   if (data?.nextPage == null) {
//                     pagingController.appendLastPage(data?.data?.toList() ?? []);
//                     widget.addLastItem?.call(pagingController);
//                   } else {
//                     pagingController.appendPage(data?.data?.toList() ?? [],
//                         (pagingController.nextPageKey ?? 1) + 1);
//                   }
//                 } else {
//                   pagingController.itemList?.clear();
//                   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
//                   pagingController.notifyListeners();
//                   pagingController.appendLastPage(data?.data?.toList() ?? []);
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
//         child: PagedListView.separated(
//           physics: widget.physics,
//           shrinkWrap: widget.shrinkWrap,
//           pagingController: pagingController,
//           padding: widget.margin ?? const EdgeInsets.all(20),
//           reverse: widget.isReversed ?? false,
//           builderDelegate: PagedChildBuilderDelegate<T>(
//             animateTransitions: true,
//             firstPageProgressIndicatorBuilder: widget.firstLoadNewPage,
//             itemBuilder: (context, item, index) =>
//                 widget.itemWidget(context, item, index, pagingController),
//             noItemsFoundIndicatorBuilder: (context) => Padding(
//               padding:
//                   EdgeInsets.zero == widget.margin || widget.margin?.left == 0
//                       ? const EdgeInsets.all(20)
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
//                       ? const EdgeInsets.all(20)
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
//                         ? const EdgeInsets.all(20)
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
//           separatorBuilder: (context, index) =>
//               widget.separatorBuilder?.call(index) ??
//               widget.separator ??
//               const SizedBox(
//                 height: 8,
//               ),
//         ),
//       ),
//     );
//   }
// }
