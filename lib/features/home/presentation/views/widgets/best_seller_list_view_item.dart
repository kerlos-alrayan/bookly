import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/book_model.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.books});
  final BookModel books;

  @override
  Widget build(BuildContext context) {
    final booksData = books.volumeInfo;
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: books);
      },
      child: SizedBox(
        height: 125,
        width: MediaQuery.of(context).size.width * .85,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CustomBookImage(imageUrl: booksData.imageLinks.thumbnail),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        booksData.title,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      booksData.authors![0],
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle14
                          .copyWith(color: const Color(0xff707070)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRating(
                          averageRating: booksData.averageRating,
                          ratingsCount: booksData.ratingsCount,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

