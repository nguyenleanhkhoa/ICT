import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class ConfigFlavor {
  static void instanceConfig() {
    FlavorConfig(
      name: 'dev',
      variables: {
        'baseUrl': dotenv.env['API_URL'],
      },
    );
  }
}
