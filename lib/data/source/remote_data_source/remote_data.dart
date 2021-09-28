import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sport_news_app/data/model/news_model.dart';

class RemoteDataSource {
  final String _endpoint = "https://reqres.in/api/users";
  final Dio _dio;

  RemoteDataSource(this._dio);

  Future<NewsModel> getPosts() async {
    NewsModel posts;

    try {
      Response<String> response = await _dio.get(_endpoint);
      var data = json.decode(response.data);
      posts = NewsModel.fromJson(data);
      return posts;
    } catch (error, stacktrace) {
      return posts;
    }
  }
}
