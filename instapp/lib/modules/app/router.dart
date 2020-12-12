import 'package:auto_route/auto_route_annotations.dart';
import 'package:instapp/home/home.dart';
import 'package:instapp/modules/login/ui/view/login_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(page: LoginPage),
  ],
)
class $Router {}