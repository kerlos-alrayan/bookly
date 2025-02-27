import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure(
            'Oops! There was an Error, Please try again later!');

      case DioExceptionType.badResponse:
        ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure(
            'Oops! There was an Error, Please try again later!');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
    }
    return ServerFailure('Oops! There was an Error, Please try again later!');
  }
  factory ServerFailure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400 || statesCode == 401 || statesCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statesCode == 404) {
      return ServerFailure('Your request not fount, Please try again later!');
    } else if (statesCode == 500) {
      return ServerFailure('Internal Server error, Please try again later!');
    }
    return ServerFailure('Oops! There was an Error, Please try again later!');
  }
}
