import 'package:rxdart/rxdart.dart';
import 'package:sport_news_app/data/model/news_model.dart';
import 'package:sport_news_app/data/repo/post_repository.dart';

import 'bloc_provider.dart';

class PostBloc implements BlocBase {
  NewsRepository _newsRepository;
  BehaviorSubject<List<NewsDataModel>> _postBehaviorSubject =
      BehaviorSubject<List<NewsDataModel>>();

  PostBloc(this._newsRepository) {
    getPosts();
  }

  getPosts() async {
    List<NewsDataModel> postModel = await _newsRepository.getPosts();
    _postBehaviorSubject.sink.add(postModel);
  }

  BehaviorSubject<List<NewsDataModel>> get postSubject => _postBehaviorSubject;

  @override
  void dispose() {
    _postBehaviorSubject.close();
  }
}
