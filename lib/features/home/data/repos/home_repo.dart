import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks({int startIndex = 0});
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({int startIndex = 0});
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String query, int startIndex = 0});
}
