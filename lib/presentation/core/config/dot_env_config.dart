import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvConfig {
  static String nameApiKey = dotenv.get('NAME_API_KEY');
}