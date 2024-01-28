import 'package:e_learning/src/core/utils/consts/constatnts.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:e_learning/src/features/settings/presentation/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          // backgroundColor: Colors.lightBlue,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              SettingsCubit.get(context).changeAppTheme();
            },
            child: const Icon(Icons.brightness_4),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                settingItemCard(
                  iconData: Icons.brightness_4_outlined,
                  context: context,
                  txt: 'Dark Mode',
                  settingControllerWidget: Switch(
                    value: isAppThemeIsDark,
                    onChanged: (value) {
                      SettingsCubit.get(context).changeAppTheme();
                    },
                    activeColor: Colors.greenAccent,
                    inactiveThumbColor: Colors.black,
                    splashRadius: 60.0,
                  ),
                ),
                vericalGab(val: 10.0),
                settingItemCard(
                  iconData: Icons.translate,
                  context: context,
                  txt: 'Language',
                  settingControllerWidget: DropdownMenu(
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
                          context: context, label: 'Arabic', value: 'ar'),
                      buildDropdownMenuEntry(
                          context: context, label: 'English', value: 'en'),
                    ],
                  ),
                ),
                vericalGab(val: 10.0),
              ],
            ),
          ),
        );
      },
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

  Container settingItemCard({
    required BuildContext context,
    required String txt,
    required Widget settingControllerWidget,
    required IconData iconData,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: isAppThemeIsDark ? HexColor('#252727') : HexColor('#ffffff'),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(iconData),
            horizentalGab(),
            Text(
              txt,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
            ),
            const Spacer(),
            settingControllerWidget,
          ],
        ),
      ),
    );
  }
}
