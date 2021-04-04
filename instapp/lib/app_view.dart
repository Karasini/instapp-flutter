import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart' as R;
import 'package:instapp/modules/app/presentation/theme/cubits/theme_cubit.dart';

import 'modules/app/presentation/localizations/localization_config.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: localizationsDelegates(),
        supportedLocales: supportedLocales(),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder(
          router: R.Router(),
          builder: (context, extendedNav) =>
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) =>
                    Theme(
                      data: themeState.theme,
                      child: extendedNav,
                    ),
              ),
        ));
  }
}
