import 'package:auto_route/auto_route.dart';
import 'package:instapp/modules/home/presentation/add_new_page.dart';
import 'package:instapp/modules/home/presentation/home_page.dart';
import 'package:instapp/modules/home/presentation/info_page.dart';
import 'package:instapp/modules/home/presentation/news_page.dart';
import 'package:instapp/modules/home/presentation/search_page.dart';
import 'package:instapp/modules/users/presentation/view/user_profile_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, usesTabsRouter: true, children: [
      AutoRoute(
        page: UserProfilePage,
        path: 'profile',
        name: 'UserProfileTab'
      ),
      AutoRoute(
          page: NewsPage,
          path: 'news',
          name: 'NewsTab'
      ),
      AutoRoute(
          page: AddNewPage,
          path: 'addNew',
          name: 'AddNewTab'
      ),
      AutoRoute(
          page: SearchPage,
          path: 'search',
          name: 'SearchTab'
      ),
      AutoRoute(
          page: InfoPage,
          path: 'info',
          name: 'InfoTab'
      ),
    ]),
  ],
)
class $AppRouter {}
