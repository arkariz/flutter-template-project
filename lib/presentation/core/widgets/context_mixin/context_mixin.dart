import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_template/presentation/core/generated/i18n/translations.g.dart';

mixin ContextMixin<T> on GetView<T> {
  late Translations slang;

  @protected
  Widget buildScreen(BuildContext context);

  @override
  Widget build(BuildContext context) {
    slang = Translations.of(context);
    return buildScreen(context);
  }
}