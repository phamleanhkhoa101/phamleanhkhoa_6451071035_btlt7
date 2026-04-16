import '../data/models/news.dart';
import '../data/repository/news_repository.dart';
import '../data/services/news_service.dart';

class NewsController {
  late final NewsRepository _repository;

  NewsController() {
    _repository = NewsRepository(NewsService());
  }

  Future<List<News>> getNews() async {
    return await _repository.fetchNews();
  }
}