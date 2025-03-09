import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/connectivity_service.dart';
import '../../../../../core/utils/storage_service.dart';
import '../../../data/models/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks({bool isRefresh = false}) async {
    if (!isRefresh) emit(NewsetBooksLoading());
    bool isConnected = await ConnectivityService.checkConnection();
    if (isConnected) {
      var response = await homeRepo.fetchNewsetBooks();
      response.fold((failure) async {
        var cachedData = await StorageService.getNewestBooks();
        if (cachedData != null && cachedData['newsetBooks'] != null) {
          List<BookModel> cachedBooks = (cachedData['newsetBooks'] as List)
              .map((e) => BookModel.fromJson(e))
              .toList();
          emit(NewsetBooksSuccess(cachedBooks));
        } else {
          emit(NewsetBooksFailure(failure.errorMessage));
        }
      }, (books) async {
        await StorageService.saveNewestBooks(books);
        emit(NewsetBooksSuccess(books));
      });
    } else {
      var cachedData = await StorageService.getNewestBooks();
      if (cachedData != null && cachedData['newsetBooks'] != null) {
        List<BookModel> cachedBooks = (cachedData['newsetBooks'] as List)
            .map((e) => BookModel.fromJson(e))
            .toList();
        emit(NewsetBooksSuccess(cachedBooks));
      } else {
        emit(NewsetBooksFailure(
            'No internet connection and no cached data available.'));
      }
    }
  }
}
