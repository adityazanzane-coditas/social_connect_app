import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:social_connect_app/core/theme/color_pallete.dart';
import 'package:social_connect_app/core/theme/fonts.dart';
import 'package:social_connect_app/features/profile/presentation/bloc/profile_bloc.dart';

class LanguageSelectionDialog extends StatefulWidget {
  @override
  _LanguageSelectionDialogState createState() => _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  int selectedIndex = 0; 
  List<String> languages = ['English', 'Marathi', 'Tamil'];

  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return RadioListTile<int>(
              contentPadding: EdgeInsets.zero,
              title: Text(
                languages[index],
                style: fonts.popins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.faintBlackTextColor,
                ),
              ),
              value: index,
              groupValue: selectedIndex,
              onChanged: (int? value) {
                setState(() {
                  selectedIndex = value!;
                  
                });
                                // context.read<SettingsBloc>().add(SelectedLanguageEvent(value!));

              },
              activeColor: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
