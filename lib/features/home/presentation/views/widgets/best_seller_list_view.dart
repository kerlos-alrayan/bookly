import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final volumeInfo = state.books[index].volumeInfo;
                final saleInfo = state.books[index].saleInfo;
                final saleability = state.books[index].saleInfo!.retailPrice;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetailsView);
                      },
                      child: BookListViewItem(
                        imageUrl: volumeInfo.imageLinks!.thumbnail,
                        title: volumeInfo.title,
                        averageRating: volumeInfo.averageRating,
                        ratingsCount: volumeInfo.ratingsCount,
                        //amount: saleInfo!.listPrice!.amount,
                       // notForSale: saleInfo.saleability,
                      )),
                );
              });
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
