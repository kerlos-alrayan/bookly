import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../home/data/models/book_model.dart';
import '../../../../home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepo homeRepo;
  Timer? _debounce;
  String _lastQuery = '';

  void fetchSearchBooks({required String query,  bool forceSearch = false}) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }
      if (query == _lastQuery && !forceSearch) return;

      _lastQuery = query;
      emit(SearchLoading());

      var response = await homeRepo.fetchSearchBooks(query: query);
      response.fold(
        (failure) => emit(SearchFailure(failure.errorMessage)),
        (books) => emit(SearchSuccess(books)),
      );
    });
  }

  void clearSearch() {
    _lastQuery = '';
    emit(SearchInitial());
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
