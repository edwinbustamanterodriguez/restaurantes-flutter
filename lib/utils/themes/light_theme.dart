import 'package:flutter/material.dart';
import 'package:restaurantes/utils/themes/colors.dart';


final ThemeData lightTheme = ThemeData(
    accentColor: kAccentColor,
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    primarySwatch: kAppBar,

    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));
