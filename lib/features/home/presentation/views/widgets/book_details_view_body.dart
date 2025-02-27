import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CustomBookAppBarDetails(),
              BookDetailsSection(),
              Expanded(
                child: SizedBox(
                  height: 49,
                ),
              ),
              SimilarBooksSection(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}