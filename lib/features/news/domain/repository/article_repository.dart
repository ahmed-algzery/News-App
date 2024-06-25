import 'package:news/core/resources/data_state.dart';

import '../entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles(
      {required String categoryQuerry});
}
