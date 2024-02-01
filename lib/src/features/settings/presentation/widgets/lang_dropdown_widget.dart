import 'package:e_learning/generated/l10n.dart';

import '../../../../core/utils/consts/constatnts.dart';
import '../cubit/settings_cubit.dart';
import 'package:flutter/material.dart';

DropdownMenu<String> buildLangOptionsDropDown(BuildContext context) {
  return DropdownMenu(
    initialSelection: SettingsCubit.get(context).appLang,
    onSelected: (value) {
      if (SettingsCubit.get(context).appLang != value) {
        SettingsCubit.get(context).changeAppLang();
      }
    },
    width: 120.0,
    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 2.0,
      ),
    ),
    dropdownMenuEntries: [
      buildDropdownMenuEntry(
        context: context,
        label: S.of(context).arabic,
        value: arabicLangCode,
      ),
      buildDropdownMenuEntry(
        context: context,
        label: S.of(context).english,
        value: englishLangCode,
      ),
    ],
  );
}

DropdownMenuEntry<String> buildDropdownMenuEntry({
  required BuildContext context,
  required String label,
  required String value,
}) {
  return DropdownMenuEntry(
    value: value,
    label: label,
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
      ),
    ),
  );
}
