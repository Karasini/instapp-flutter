import 'package:flutter/material.dart';

import 'bottom/bottom_nav.dart';
import 'header/app_header.dart';

class AppScaffold extends StatelessWidget {
  final Widget widget;

  const AppScaffold({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppHeader(),
      body: widget,
    );
  }
}
