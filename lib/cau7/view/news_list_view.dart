import 'package:flutter/material.dart';
import '../common/widget/loading_widget.dart';
import '../controller/news_controller.dart';
import '../data/models/news.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final NewsController _controller = NewsController();

  bool _isLoading = true;
  String _errorMessage = '';
  List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final news = await _controller.getNews();

      setState(() {
        _newsList = news.take(15).toList();
        _errorMessage = '';
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Lỗi: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshNews() async {
    final news = await _controller.getNews();

    setState(() {
      _newsList = news.take(15).toList();
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('News List - 6451071035'),
        ),
        body: LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('News List - 6451071035'),
      ),
      body: _errorMessage.isNotEmpty
          ? Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      )
          : RefreshIndicator(
        onRefresh: _refreshNews,
        child: _newsList.isEmpty
            ? ListView(
          children: const [
            SizedBox(height: 200),
            Center(
              child: Text('Không có dữ liệu'),
            ),
          ],
        )
            : ListView.builder(
          itemCount: _newsList.length,
          itemBuilder: (context, index) {
            final news = _newsList[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(news.id.toString()),
                ),
                title: Text(news.title),
                subtitle: Text(
                  news.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}