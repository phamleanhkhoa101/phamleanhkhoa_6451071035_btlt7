import '../models/news.dart';
import '../services/news_service.dart';

class NewsRepository {
  final NewsService _newsService;

  NewsRepository(this._newsService);

  Future<List<News>> fetchNews() async {
    final data = await _newsService.fetchNewsJson();
    return data.map((e) => News.fromJson(e)).toList();
  }
}