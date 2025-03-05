import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/shimmer.dart';

class LoadingCustomBookImage extends StatelessWidget {
  const LoadingCustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ShimmerColors.baseShimmerColor,
      highlightColor: ShimmerColors.highlightShimmerColor,
      child: Container(
        decoration: BoxDecoration(
          color: ShimmerColors.widgetShimmerColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
        ),
      ),
    );
  }
}
