import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/data/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.kBookDetailsView);
                },
                child: BestSellerListViewItem()),
          );
        });
  }
}