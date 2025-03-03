part of 'test_cubit.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

final class TestLoading extends TestState {}

final class TestSuccess extends TestState {
  final TestBookModel testBookModel;
  TestSuccess(this.testBookModel);
}

final class TestFailure extends TestState {
  final String errorMessage;
  TestFailure(this.errorMessage);
}
