import 'package:core/core.dart';
import 'package:core/dependency.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:produk/application/application.dart';
import 'package:produk/produk.dart';

@RoutePage()
class ProdukListPage extends StatelessWidget {
  const ProdukListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProdukCubit>(
      create: (context) => getIt()..fetchList(),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukCubit, ProdukState>(
      builder: (context, state) {
        return Scaffold(
          appBar: feriAppBar(title: "List Produk"),
          persistentFooterButtons: [
            CustomButton(
                onPressed: () {
                  AutoRouter.of(context).pushNamed("/carts");
                },
                margin: const EdgeInsets.symmetric(horizontal: 20),
                buttonText: "Lihat Cart")
          ],
          body: PageWrapper(
            respon: state.list,
            retry: () {
              context.read<ProdukCubit>().fetchList();
            },
            success: (data) {
              final list = data?.toList() ?? [];
              return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = list.get(index);
                    return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(item.title ?? ""),
                            CustomText(
                              "${item.price?.toInt().toString().toRupiahFormat() ?? ""})",
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        onTap: () {
                          context
                              .pushRoute(ProdukDetailRoute(id: item.id ?? -1));
                          // context.router
                          //     .pushNamed("/produk/${element.id}");
                        });
                  },
                  separatorBuilder: (context, index) => const Divider(
                        height: 1,
                      ),
                  itemCount: list.length);
            },
          ),
        );
      },
    );
  }
}
