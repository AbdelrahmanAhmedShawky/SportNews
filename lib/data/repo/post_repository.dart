import 'package:sport_news_app/data/model/news_model.dart';
import 'package:sport_news_app/data/source/remote_data_source/remote_data.dart';

import '../../internet_connection.dart';

class NewsRepository {
  RemoteDataSource _remoteDataSource;
  InternetConnection _connection;

  NewsRepository(this._remoteDataSource, this._connection);

  Future<List<NewsDataModel>> getPosts() async {
    List<NewsDataModel> postModel = [];
    await _connection.checkConnectivity().then((internetConnection) async {
      if (internetConnection) {
        // you can change this logic depend on the business
        await _remoteDataSource.getPosts().then((value) {
          postModel = value.data;
        });
      }
    });

    return postModel;
  }
}
