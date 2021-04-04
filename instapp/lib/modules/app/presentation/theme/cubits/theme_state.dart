part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final bool isLightTheme;

  ThemeState(this.theme, this.isLightTheme) {
    setCurrentStatusNavigationBarColor(isLightTheme);
  }

  @override
  List<Object> get props => [theme, isLightTheme];

  ThemeState.dark()
      : theme = appDarkTheme,
        isLightTheme = false {
    setCurrentStatusNavigationBarColor(isLightTheme);
  }

  ThemeState.light()
      : theme = appLightTheme,
        isLightTheme = true {
    setCurrentStatusNavigationBarColor(isLightTheme);
  }
}
