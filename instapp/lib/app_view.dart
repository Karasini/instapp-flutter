import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instapp/modules/app/presentation/localizations/localization_config.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart';
import 'package:instapp/modules/app/presentation/theme/cubits/theme_cubit.dart';

class AppView extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates(),
      supportedLocales: supportedLocales(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      builder: (context, router) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) => Theme(
          data: themeState.theme,
          child: router!,
        ),
      ),
    );
  }
}