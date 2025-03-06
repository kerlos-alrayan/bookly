import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action_books_details.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final bookDetails = bookModel.volumeInfo;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // Image
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .2),
            child: CustomBookImage(
              imageUrl: bookDetails.imageLinks!.thumbnail,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            bookDetails.title,
            textAlign: TextAlign.center,
            style: Styles.textStyle30,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            bookDetails.authors[0],
            textAlign: TextAlign.center,
            style: Styles.textStyle18
                .copyWith(fontFamily: 'Raleway', fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 14,
          ),
          BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            averageRating: bookDetails.averageRating,
            ratingsCount: bookDetails.ratingsCount,
          ),
          const SizedBox(
            height: 37,
          ),
          BooksAction(bookModel: bookModel,),
        ],
      ),
    );
  }
}
