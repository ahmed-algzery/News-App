import 'package:dio/dio.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/core/resources/http_response.dart';
import 'package:news/features/news/data/data_sources/remote/news_api_service.dart';
import 'package:news/features/news/data/models/article.dart';

class NewsApiServiceImpl implements NewsApiService {
  NewsApiServiceImpl(this.dio);

  final Dio dio;

  @override
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles(
      {required String apiKey, required String category}) async {
    final response = await dio.get('$newsAPIBaseURL/top-headlines',
        queryParameters: {
          'apikey': apiKey,
          'country': 'eg',
          'category': category
        });

    List<ArticleModel> value = response.data!['articles']
        .map<ArticleModel>(
            (dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, response);
    return httpResponse;
  }
}
