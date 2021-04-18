import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

BottomNavigationBar buildBottomNav(BuildContext context, TabsRouter tabsRouter) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: AppLocalizations.of(context)!.bottomNavNews,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: AppLocalizations.of(context)!.bottomNavSearch,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        label: AppLocalizations.of(context)!.bottomNavAddNew,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bookmark),
        label: AppLocalizations.of(context)!.bottomNavInfo,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: AppLocalizations.of(context)!.bottomNavMyProfile,
      ),
    ],
    currentIndex: tabsRouter.activeIndex,
    onTap: (index) => tabsRouter.setActiveIndex(index),
  );
}