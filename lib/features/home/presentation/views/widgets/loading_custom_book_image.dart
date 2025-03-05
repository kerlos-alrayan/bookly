import 'package:flutter/material.dart';

import '../../../../../core/utils/shimmer.dart';

class LoadingCustomBookImage extends StatelessWidget {
  const LoadingCustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ShimmerColors.widgetShimmerColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
      ),
    );
  }
}
