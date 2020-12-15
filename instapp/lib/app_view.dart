import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:instapp/modules/app/router.gr.dart' as R;

var logger = Logger();

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    logger.d("Logger is working!");

    return MaterialApp(
        builder: ExtendedNavigator.builder(
      router: R.Router(),
      builder: (context, extendedNav) => Theme(
        data: ThemeData(brightness: Brightness.dark),
        child: extendedNav,
      ),
    ));
  }
}
