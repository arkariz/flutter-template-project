import 'package:project_template/data/utility/service_manager/name_flavor.dart';
import 'package:project_template/presentation/core/config/dot_env_config.dart';

class NameEnvirontmentProd extends NameFlavor {
  @override
  String get apikey => DotEnvConfig.nameApiKey;

  @override
  String get baseUrl => "https://potterapi-fedeperin.vercel.app/";

  @override
  String get environtment => "prod";

}