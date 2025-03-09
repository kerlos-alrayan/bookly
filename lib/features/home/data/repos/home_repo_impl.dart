import 'dart:math';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  final Random _random = Random();
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks({int startIndex = 0}) async {
    try {
      int randomStartIndex = _random.nextInt(100);

      var data = await apiService.get(
        endPoint:
        'volumes?q=computer science&maxResults=40&filter=free-ebooks&startIndex=$randomStartIndex',
      );

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({int startIndex = 0}) async {
    try {
      int randomStartIndex = _random.nextInt(100);

      var data = await apiService.get(
          endPoint: 'volumes?q=love&maxResults=40&filter=free-ebooks&startIndex=$randomStartIndex');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?q=$category&maxResults=40&filter=free-ebooks&sorting=relevance');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks(
      {required String query, int startIndex = 0}) async {
    try {
      int randomStartIndex = _random.nextInt(100);
      if (query.isEmpty) {
        return right([]);
      }
      var data = await apiService.get(
          endPoint:
              'volumes?q=$query&maxResults=40&filter=free-ebooks&sorting=relevance&startIndex=$randomStartIndex');

      if (data == null || !data.containsKey('items') || data['items'] == null) {
        print('No items found in response.');
        return right([]);
      }

      print('API Response: $data');

      List<BookModel> books = [];
      for (var item in data['items']) {
        if (item is Map<String, dynamic>) {
          try {
            books.add(BookModel.fromJson(item));
          } catch (e) {
            print('Error parsing item: $item');
            print('Parsing error: $e');
          }
        } else {
          print('Invalid item type: ${item.runtimeType}');
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
