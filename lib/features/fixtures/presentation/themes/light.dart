import 'package:fixtures_app/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

Mycolors colors = Mycolors();

class LightTheme {
  ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: colors.lightBg,
      cardColor: colors.ligtLeagueCard,
      primaryColorLight: colors.ligtLeagueCard,
      shadowColor: Colors.black54,
      focusColor: colors.lightTime,
      primaryColorDark: Colors.white,
      hintColor: colors.lightFontsecond,
      brightness: Brightness.light,
      dialogBackgroundColor: colors.lightcardborder,
      primaryColor: colors.lightFontprimery,
      secondaryHeaderColor: colors.lightLeaguecardSecond);
}
