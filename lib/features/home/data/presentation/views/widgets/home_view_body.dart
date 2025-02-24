import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage(AssetsData.testImage), fit: BoxFit.cover),
              ),
            ),
          )
        ],
      ),
    );
  }
}
