import 'package:e_learning/generated/l10n.dart';
import 'package:e_learning/src/config/routes/navigation.dart';
import 'package:e_learning/src/core/utils/widgets/loading_screen.dart';
import 'package:e_learning/src/core/utils/widgets/no_connection_screen.dart';
import 'package:e_learning/src/features/auth/presentation/pages/login_screen.dart';
import 'package:e_learning/src/features/home/presentation/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      listener: (context, state) {
        if (state is SettingsUserLogoutSuccessState) {
          navigateAndKillTo(context: context, screen: const LoginScreen());
        }
        if (state is SettingsUserLogoutLoadingState) {
          const LoadingScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).settings),
          ),
          body: currentUserEntity.uID == ''
              ? const NoConnectionScreen()
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.all(10.0),
                        height: ScreenSizes.getHieght(context) / 6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
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
                              userEmail: FirebaseAuth.instance.currentUser ==
                                      null
                                  ? ' '
                                  : FirebaseAuth.instance.currentUser!.email!,
                              userName: currentUserEntity.name,
                            ),
                          ],
                        ),
                      ),
                      vericalGab(val: 20.0),
                      settingItemCard(
                        iconData: Icons.brightness_4_outlined,
                        context: context,
                        txt: S.of(context).dark_mode,
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
                        txt: S.of(context).language,
                        settingControllerWidget:
                            buildLangOptionsDropDown(context),
                      ),
                      vericalGab(val: 10.0),
                      settingItemCard(
                        iconData: Icons.help_outline,
                        context: context,
                        txt: S.of(context).help_center,
                        settingControllerWidget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                      vericalGab(val: 10.0),
                      settingItemCard(
                        iconData: Icons.info_outline,
                        context: context,
                        txt: S.of(context).about_us,
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
