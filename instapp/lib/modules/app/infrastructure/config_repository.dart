import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:instapp/modules/app/domain/config/config_repository_abstract.dart';
import 'package:instapp/modules/app/domain/config/open_id_config.dart';

@Injectable(as: ConfigRepositoryAbstract)
class ConfigRepository implements ConfigRepositoryAbstract {
  OpenIdConfig getOpenId() {
    final config = GlobalConfiguration().getDeepValue("openId");
    return OpenIdConfig.fromJson(config);
  }
}