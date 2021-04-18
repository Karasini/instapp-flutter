import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = context.tabsRouter.current?.name;
    return Center(
      child: Text(title ?? ''),
    );
  }
}
