import 'package:bookly/features/home/presentation/views/widgets/loading_custom_book_image.dart';
import 'package:flutter/material.dart';

class LoadingFeaturedListView extends StatelessWidget {
  const LoadingFeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: const LoadingCustomBookImage(),
              )),
    );
  }
}
