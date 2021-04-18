import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:instapp/modules/app/presentation/layout/app_scaffold.dart';
import 'package:instapp/modules/app/presentation/layout/bottom/bottom_nav.dart';
import 'package:instapp/modules/app/presentation/routes/router.gr.dart';
import 'package:instapp/modules/app/presentation/theme/app_animations.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      widget: AutoTabsRouter(
        routes: [
          NewsTab(),
          SearchTab(),
          AddNewTab(),
          InfoTab(),
          UserProfileTab()
        ],
        duration: AppAnimations.duration,
        builder: (context, child, animation) => Scaffold(
          body: FadeTransition(child: child, opacity: animation),
          bottomNavigationBar: buildBottomNav(context, context.tabsRouter),
        ),
      ),
    );
  }
}
