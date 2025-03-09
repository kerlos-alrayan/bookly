import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/connectivity_service.dart';
import '../../../../../core/utils/storage_service.dart';
import '../../../data/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    bool isConnected = await ConnectivityService.checkConnection();
    if (isConnected) {
      var response = await homeRepo.fetchSimilarBooks(category: category);
      response.fold((failure) async {
        var cachedData = await StorageService.getSimilarBooks(category);
        if (cachedData != null && cachedData['similarBooks'] != null) {
          List<BookModel> cachedBooks = (cachedData['similarBooks'] as List)
              .map((e) => BookModel.fromJson(e))
              .toList();
          emit(SimilarBooksSuccess(cachedBooks));
        } else {
          emit(SimilarBooksFailure(failure.errorMessage));
        }
      }, (books) async {
        await StorageService.saveSimilarBooks(category, books);
        emit(SimilarBooksSuccess(books));
      });
    } else {
      var cachedData = await StorageService.getSimilarBooks(category);
      if (cachedData != null && cachedData['similarBooks'] != null) {
        List<BookModel> cachedBooks = (cachedData['similarBooks'] as List)
            .map((e) => BookModel.fromJson(e))
            .toList();
        emit(SimilarBooksSuccess(cachedBooks));
      } else {
        emit(SimilarBooksFailure(
            'No internet connection, so no books available🤷‍♂️'));
      }
    }
  }
}
