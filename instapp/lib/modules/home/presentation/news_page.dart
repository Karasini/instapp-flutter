import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = context.tabsRouter.current?.name;
    return Center(
      child: Text(title ?? ''),
    );
  }
}
