import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/test_image/test_cubit.dart';

class TestImage extends StatelessWidget {
  const TestImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        if (state is TestLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TestSuccess) {
          final imageUrl = state.testBookModel.items;
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.testBookModel.items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    child: CustomBookImage(
                      imageUrl: imageUrl[index].volumeInfo!.imageLinks.thumbnail, title: imageUrl[index].volumeInfo!.title,
                    ),),
                ),
              ),
            ),
          );
        } else if(state is TestFailure){
          return Text(state.errorMessage);
        }return SizedBox();
      },
    );
  }
}
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl, required this.title});
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover
          ),
        ),
        child: Text(title),
      ),
    );
  }
}
