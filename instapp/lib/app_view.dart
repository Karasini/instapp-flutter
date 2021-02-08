import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart' as R;

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {

  @override
  Widget build(BuildContext context) {

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
