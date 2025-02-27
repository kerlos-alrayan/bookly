import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action_books_details.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // Image
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2),
            child: const CustomBookImage(),
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
                fontFamily: 'Raleway', fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 14,
          ),
          const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 37,
          ),
          BooksAction(),

        ],
      ),
    );
  }
}
