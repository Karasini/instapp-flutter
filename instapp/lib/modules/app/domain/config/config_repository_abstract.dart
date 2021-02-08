import 'package:instapp/modules/app/domain/config/open_id_config.dart';

abstract class ConfigRepositoryAbstract {
  OpenIdConfig getOpenId();
}