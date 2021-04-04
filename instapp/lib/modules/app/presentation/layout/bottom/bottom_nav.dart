import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context).bottomNavNews,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppLocalizations.of(context).bottomNavSearch,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: AppLocalizations.of(context).bottomNavAddNew,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: AppLocalizations.of(context).bottomNavInfo,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context).bottomNavMyProfile,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
