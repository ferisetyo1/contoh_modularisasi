import 'package:flutter/material.dart';
import 'package:core/dependency.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  const CustomShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
