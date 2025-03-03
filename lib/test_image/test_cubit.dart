import 'package:bloc/bloc.dart';
import 'package:bookly/test_image/model.dart';
import 'package:bookly/test_image/repo.dart';
import 'package:meta/meta.dart';



part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  Future getBooksTest() async {
    emit(TestLoading());
    try {
      final response = await ApiTest().testData();
      final dataResponse = TestBookModel.fromJson(response.data);
      emit(TestSuccess(dataResponse));
      return dataResponse;
    } catch (e) {
      emit(TestFailure('Failed to fetch data: $e'));
    }
  }
}
