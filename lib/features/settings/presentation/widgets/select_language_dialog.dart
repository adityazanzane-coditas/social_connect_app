import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/settings/presentation/widgets/choose_lang_alert_dialog.dart';

Future<void> showLanguageDialog(BuildContext context) async {
print('inside show language efun');
 
  return showDialog(
    context: context,
    builder: (BuildContext context) {

      return const LanguageSelectionDialog();
    },
  );
}
