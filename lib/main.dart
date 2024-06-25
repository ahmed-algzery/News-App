import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_bloc.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_state.dart';
import 'package:news/features/news/presentation/pages/home/news.dart';
import 'injection_container.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependecies();
  await initializeDateFormatting('ar');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => locator()..add(GetArticlesEvent()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'News',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: const News(),
          );
        },
      ),
    );
  }
}
