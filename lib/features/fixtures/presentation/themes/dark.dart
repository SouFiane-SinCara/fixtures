import 'package:fixtures_app/features/fixtures/presentation/themes/light.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: colors.darkBg,
      cardColor: colors.darkLeagueCard,
      primaryColorLight: colors.darkLeagueCard,
      brightness: Brightness.dark,
      shadowColor: const Color.fromARGB(255, 0, 0, 0),
      focusColor: colors.darkTime,
      primaryColorDark: const Color.fromARGB(255, 0, 0, 0),
      hintColor: colors.darkFontsecond,
      dialogBackgroundColor: colors.darkcardborder,
      primaryColor: colors.darkFontprimery,
      secondaryHeaderColor: colors.darkLeaguecardSecond);
}
