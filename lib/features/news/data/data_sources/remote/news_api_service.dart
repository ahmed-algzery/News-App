import 'package:news/features/news/data/models/article.dart';

import '../../../../../core/resources/http_response.dart';

abstract class NewsApiService {
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles(
      {required String apiKey, required String category});
}
