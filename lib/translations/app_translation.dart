import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome': 'Hello @name welcome',
    },
    'es_ES': {
      'welcome': 'Hola @name bienvenido',
    }
  };
}

