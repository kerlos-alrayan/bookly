import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/connectivity_service.dart';
import '../../../../../core/widgets/custom_alert_dialog_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
        onRefresh: () async {
          bool isConnected = await ConnectivityService.checkConnection();
          if (!isConnected) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialogWidget(
                content: 'No internet connection. Please check your network.',
              ),
            );
          } else {
            context.read<FeatureBooksCubit>().fetchFeaturedBooks();
            context.read<NewsetBooksCubit>().fetchNewsetBooks();
          }
    },
    child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              // App Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              const SizedBox(height: 50),

              // Best Seller Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Newset Books',
                  style: Styles.textStyle18,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        // Best Seller List View
        SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    ));
  }
}
