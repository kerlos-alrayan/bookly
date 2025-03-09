import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/core/utils/connectivity_service.dart';
import 'package:bookly/core/utils/storage_service.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());

    bool isConnected = await ConnectivityService.checkConnection();
    if (isConnected) {

      var response = await homeRepo.fetchFeaturedBooks();
      response.fold((failure) async {
        var cachedData = await StorageService.getFeaturedBooks();
        if (cachedData != null && cachedData['featuredBooks'] != null) {
          List<BookModel> cachedBooks = (cachedData['featuredBooks'] as List)
              .map((e) => BookModel.fromJson(e))
              .toList();
          emit(FeatureBooksSuccess(cachedBooks));
        } else {
          emit(FeatureBooksFailure(failure.errorMessage));
        }
      }, (books) async {
        await StorageService.saveFeaturedBooks(books);
        emit(FeatureBooksSuccess(books));
      });
    } else {
      var cachedData = await StorageService.getFeaturedBooks();
      if (cachedData != null && cachedData['featuredBooks'] != null) {
        List<BookModel> cachedBooks = (cachedData['featuredBooks'] as List)
            .map((e) => BookModel.fromJson(e))
            .toList();
        emit(FeatureBooksSuccess(cachedBooks));
      } else {
        emit(FeatureBooksFailure(
            'No internet connection and no cached data available.'));
      }
    }
  }
}
