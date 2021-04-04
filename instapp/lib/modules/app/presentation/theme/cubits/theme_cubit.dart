import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/presentation/theme/app_theme.dart';

part 'theme_state.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light());

  void toggleTheme() {
    if (this.state.isLightTheme) {
      emit(ThemeState.dark());
    } else {
      emit(ThemeState.light());
    }
  }
}