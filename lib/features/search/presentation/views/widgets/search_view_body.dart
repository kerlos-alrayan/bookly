import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          CustomSearchBar(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
