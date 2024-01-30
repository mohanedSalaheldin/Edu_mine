import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_state.dart';
import '../widgets/lang_dropdown_widget.dart';
import '../widgets/settings_card_item_widget.dart';
import '../widgets/settings_header_widget.dart';
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
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(10.0),
                  height: ScreenSizes.getHieght(context) / 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        HexColor('#1f2e3c'),
                        HexColor('#162534'),
                        HexColor('#0c1c2c'),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSettingsHeaderWithUserDataAnDLogoutButton(
                          context: context,
                          userEmail: 'mohnsd2002@gmail.com',
                          userName: 'M.Salah'),
                    ],
                  ),
                ),
                vericalGab(val: 20.0),
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
                  settingControllerWidget: buildLangOptionsDropDown(context),
                ),
                vericalGab(val: 10.0),
                settingItemCard(
                  iconData: Icons.help_outline,
                  context: context,
                  txt: 'Help Center',
                  settingControllerWidget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
                vericalGab(val: 10.0),
                settingItemCard(
                  iconData: Icons.info_outline,
                  context: context,
                  txt: 'About Us',
                  settingControllerWidget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
