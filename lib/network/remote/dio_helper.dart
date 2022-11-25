import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dioHelper;
  static dioInitial() {
    dioHelper = Dio(
      BaseOptions(
        baseUrl: 'https://jokeapi-v2.p.rapidapi.com/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'X-RapidAPI-Key':
              '22c746661cmshebb8c76986c0deap1d867fjsn2c0de6baee33',
          'X-RapidAPI-Host': 'jokeapi-v2.p.rapidapi.com'
        },
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    dioHelper.options.headers = {
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': '22c746661cmshebb8c76986c0deap1d867fjsn2c0de6baee33',
      'X-RapidAPI-Host': 'jokeapi-v2.p.rapidapi.com'
    };
    return await dioHelper.get(endpoint, queryParameters: query);
  }
}
