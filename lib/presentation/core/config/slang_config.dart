import 'package:flutter/material.dart';
import 'package:project_template/presentation/core/generated/i18n/translations.g.dart';

class SlangConfig {
  static final SlangConfig _instance = SlangConfig._internal();

  SlangConfig._internal();

  static SlangConfig get instance => _instance;

  Translations? _tr;

  void init(BuildContext context) {
    _tr = Translations.of(context);
  }

  Translations get translations {
    if (_tr == null) {
      throw Exception('Translations have not been initialized. Call init() first.');
    }
    return _tr!;
  }
}

// Usage
Translations get slang => SlangConfig.instance.translations;