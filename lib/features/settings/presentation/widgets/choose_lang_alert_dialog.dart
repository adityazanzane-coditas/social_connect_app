import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_connect_app/core/language_model.dart/language_model.dart';

import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_event.dart';
import 'package:social_connect_app/features/settings/presentation/bloc/settings_state.dart';

class LanguageSelectionDialog extends StatefulWidget {
  @override
  _LanguageSelectionDialogState createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  int selectedIndex = 0;
  List<String> languages = ['English', 'Marathi', 'Tamil'];

  final Fonts fonts = Fonts();

  // var groupValue = "mr";

  @override
  Widget build(BuildContext context) {
    // final groupValue = context.read<LanguageBloc>().state.locale.languageCode;

    return AlertDialog(
        titleTextStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        titlePadding: const EdgeInsets.only(top: 5, bottom: 20),
        insetPadding: const EdgeInsets.all(1),
        contentPadding: const EdgeInsets.only(left: 14, right: 14, bottom: 15),
        actionsPadding: const EdgeInsets.all(10),
        actionsAlignment: MainAxisAlignment.end,
        buttonPadding: const EdgeInsets.all(60),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
        backgroundColor: ColorPallete.whiteColor,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Select Language',
                style: fonts.alata(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.faintBlackTextColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10.0,
              color: ColorPallete.faintBlackTextColor,
              height: 1,
            ),
          ],
        ),
        content: BlocConsumer<LanguageBloc, LanguageState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            String groupValue = state.locale.languageCode;
print('*****************************$groupValue');
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: languageModel.length,
                itemBuilder: (context, index) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: languageModel.length,
                    itemBuilder: (context, index) {
                      var item = languageModel[index];

                      return RadioListTile(
                        value: item.languageCode,
                        groupValue: groupValue,
                        onChanged: (value) {
                          print(groupValue);
                          print(item.languageCode);

                          BlocProvider.of<LanguageBloc>(context).add(
                              LoadLocalizationEvent(
                                  locale: Locale(item.languageCode)));
                        },
                        title: Text(item.language),
                        subtitle: Text(item.sublanguage),
                      );
                    },
                  );
                },
              ),
            );
          },
        ));
  }
}
