import 'package:flutter/material.dart';
import 'package:instapp/modules/app/presentation/layout/app_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      widget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(AppLocalizations.of(context).homePageTitle),
          ],
        ),
      ),
    );
  }
}
