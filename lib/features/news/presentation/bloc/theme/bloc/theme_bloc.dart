import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/util/theme.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_event.dart';
import 'package:news/features/news/presentation/bloc/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(AppTheme.lightTheme)) {
    on<ToggleTheme>((event, emit) {
      emit(state.themeData.brightness == Brightness.light
          ? ThemeState(AppTheme.darkTheme)
          : ThemeState(AppTheme.lightTheme));
    });
  }
}
