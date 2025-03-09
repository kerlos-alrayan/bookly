import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../../../../home/presentation/views/widgets/loading_books_list_view_items.dart';
import '../../manger/search_cubit/search_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.searchBooks.isEmpty) {
            return const Center(
              child: Text(
                'No results found for this search',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
          return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<SearchCubit>()
                    .fetchSearchBooks(query: "Your Query");
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: state.searchBooks.length,
                itemBuilder: (context, index) {
                  final book = state.searchBooks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kBookDetailsView, extra: book);
                      },
                      child: BookListViewItem(books: book),
                    ),
                  );
                },
              ));
        } else if (state is SearchLoading) {
          return LoadingBookListViewItem();
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: Text('Search for a book...'));
        }
      },
    );
  }
}
