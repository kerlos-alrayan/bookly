import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
              onTap: (){
                GoRouter.of(context).push(AppRouter.kBookDetailsView);
              },
              child: CustomBookImage()),
        ),
      ),
    );
  }
}