import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makit_test_task/utils/localization/languages/russian_locale.dart';

class GetLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': Russian.locale,
      };
}

class Locales {
  Locale get ruLocale => const Locale('ru');
}
