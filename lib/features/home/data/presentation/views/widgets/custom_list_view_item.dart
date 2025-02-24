import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

class CustomListViewItems extends StatelessWidget {
  const CustomListViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              image: AssetImage(AssetsData.testImage),
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
