part of 'remote_article_bloc.dart';

abstract class RemoteArticlesEvent {}

class GetArticlesEvent extends RemoteArticlesEvent {}

class ChangeCategoryEvent extends RemoteArticlesEvent {
  final String category;
  ChangeCategoryEvent(this.category);
}
