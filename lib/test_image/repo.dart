import 'package:dio/dio.dart';

class ApiTest{
  Future<Response> testData() async{
    final response =await Dio().get('https://www.googleapis.com/books/v1/volumes?q=subject:Programming&Filtering=free-ebooks');
    return response;
  }
}
