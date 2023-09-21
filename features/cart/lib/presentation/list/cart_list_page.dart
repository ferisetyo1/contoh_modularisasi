import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => getIt()..fetchCarts(),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: feriAppBar(title: "Carts"),
          body: PageWrapper(
            respon: state.detail,
            retry: () {
              context.read<CartCubit>().fetchCarts();
            },
            success: (data) {
              final list = data?.products ?? [];
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
                          CustomText(item.produk?.title ?? ""),
                          CustomText(
                            "${item.produk?.price?.toInt().toString().toRupiahFormat() ?? ""} (${item.quantity}x)",
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    );
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
