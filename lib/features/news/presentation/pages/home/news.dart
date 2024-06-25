// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/constants/constants.dart';
import 'package:news/features/news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_bloc.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_event.dart';
import 'package:news/features/news/presentation/widgets/article_tile.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with AutomaticKeepAliveClientMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RemoteArticleBloc>();
    super.build(context);
    final themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'أخبـــــــــارى',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoading();
          }
          if (state.error != null) {
            return _buildErroView(
                state.error?.message ?? 'حدث خطأ حاول مجداً !!');
          }
          if (state.articles.isEmpty) {
            return _buildNoData();
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      hint: const Text('التصنيف'),
                      value: state.currentCategory,
                      items: categories.map((String e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(categoryTranslations[e] ?? e),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          bloc.add(ChangeCategoryEvent(value));
                        }
                      },
                    ),
                    Center(
                      child: IconButton(
                        icon: Icon(
                          context.select((ThemeBloc bloc) =>
                              bloc.state.themeData.brightness == Brightness.dark
                                  ? Icons.dark_mode
                                  : Icons.light_mode),
                        ),
                        onPressed: () => themeBloc.add(ToggleTheme()),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) =>
                      ArticleTile(article: state.articles[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildErroView(String msg) {
    return Center(child: Text(msg));
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNoData() {
    return const Center(
      child: Text('لا يوجد أخبار'),
    );
  }
}
