part of 'remote_article_bloc.dart';

class RemoteArticleState extends Equatable {
  const RemoteArticleState({
    required this.articles,
    required this.isLoading,
    required this.currentCountry,
    required this.currentCategory,
    required this.error,
  });

  final List<ArticleEntity> articles;
  final String currentCountry;
  final String currentCategory;
  final bool isLoading;
  final DioException? error;

  factory RemoteArticleState.initial() => const RemoteArticleState(
        articles: [],
        isLoading: false,
        currentCountry: 'in',
        currentCategory: 'general',
        error: null,
      );

  @override
  List<Object?> get props => [
        articles,
        currentCountry,
        currentCategory,
        isLoading,
        error,
      ];

  RemoteArticleState copyWith({
    List<ArticleEntity>? articles,
    String? currentCountry,
    String? currentCategory,
    bool? isLoading,
    DioException? error,
  }) {
    return RemoteArticleState(
      articles: articles ?? this.articles,
      currentCountry: currentCountry ?? this.currentCountry,
      currentCategory: currentCategory ?? this.currentCategory,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
