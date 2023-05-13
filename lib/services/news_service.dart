import 'dart:convert';
import 'dart:io';
import 'package:news_app/model/article.dart';
import "package:http/http.dart" as http;
import 'package:news_app/model/news.dart';

class NewsService {
  Future<List<Articles>> fetchDataApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=fa462ce2ec974bfc9a345acaaae761fb";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      News news = News.fromJson(json);
      return news.articles??[];
    }
    throw Exception("Hata");
  }
}
