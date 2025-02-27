import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureBooksLoading());
    var response = await homeRepo.fetchFeaturedBooks();
    response.fold((failure) {
      emit(FeatureBooksFailure(failure.errorMessage));
    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
