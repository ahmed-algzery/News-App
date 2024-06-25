import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/news/domain/entities/article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/domain/usecases/get_article.dart';
part 'remote_article_state.dart';
part 'remote_article_events.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(RemoteArticleState.initial()) {
    on<GetArticlesEvent>(getArticles);
    on<ChangeCategoryEvent>(changeCategory);
  }

  getArticles(GetArticlesEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final dataState = await _getArticleUseCase(
        params: (state.currentCountry, state.currentCategory));

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        emit(state.copyWith(articles: dataState.data, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(error: dataState.error, isLoading: false));
    }
  }

  changeCategory(ChangeCategoryEvent event, Emitter emit) async {
    emit(state.copyWith(currentCategory: event.category));
    add(GetArticlesEvent());
  }
}
