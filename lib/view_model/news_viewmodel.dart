import 'package:news_app/model/article.dart';
import 'package:news_app/services/news_service.dart';

class ListNewsVievModel {
  List<ArticlesViewModel>? articles;
  Future<void> fetchNews() async {
    final apiResult = await NewsService().fetchDataApi();
    articles = apiResult.map((e) => ArticlesViewModel(e)).toList();
  }
}

class ArticlesViewModel {
  final Articles? articlesModel;
  ArticlesViewModel(this.articlesModel);
}
