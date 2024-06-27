import 'package:flutter/material.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/settings/presentation/widgets/choose_lang_alert_dialog.dart';

Future<void> showLanguageDialog(BuildContext context) async {
  // final Fonts fonts = Fonts();
print('inside show language efun');
  // double textScaleFactor = MediaQuery.of(context).textScaleFactor;
  // if (textScaleFactor > 1.5) {
  //   textScaleFactor = 1.6;
  // }
  return showDialog(
    context: context,
    builder: (BuildContext context) {

      return LanguageSelectionDialog();
    },
  );
}
