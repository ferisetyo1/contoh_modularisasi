import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core/dependency.dart';
import 'package:auto_route/auto_route.dart';
import 'package:produk/application/application.dart';

@RoutePage()
class ProdukDetailPage extends StatelessWidget {
  final int id;
  const ProdukDetailPage({
    super.key,
    @PathParam() required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProdukCubit>(
      create: (context) => getIt()..fetchDetail(id),
      child: _Content(
        id: id,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final int id;
  const _Content({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukCubit, ProdukState>(
      builder: (context, state) {
        return Scaffold(
          appBar: feriAppBar(title: "Detail Produk"),
          body: PageWrapper(
            respon: state.detail,
            retry: () {
              context.read<ProdukCubit>().fetchDetail(id);
            },
            success: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: data?.image ?? "",
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  data?.title ?? "",
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  data?.price?.toInt().toString().toRupiahFormat() ?? "",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                const SizedBox(height: 8),
                CustomText(
                  data?.description ?? "",
                  fontSize: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
