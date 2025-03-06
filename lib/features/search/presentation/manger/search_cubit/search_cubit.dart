import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/book_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSearchBooks({required String query}) async {
    emit(SearchLoading());
    var response = await homeRepo.fetchSearchBooks(query: query);
    response.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (similarBooks) {
      emit(SearchSuccess(similarBooks));
    });
  }

  void clearSearch() {
    emit(SearchInitial());
  }

}
