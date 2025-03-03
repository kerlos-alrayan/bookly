import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          child: Text(''),
                //child:BookListViewItem(imageUrl: '', title: '', averageRating: 0, ratingsCount: 0, amount: 0,,)),
            ));
        });
  }
}
