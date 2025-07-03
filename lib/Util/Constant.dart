import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Theme
ThemeData getThemeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1976D2),
    foregroundColor: Colors.white,
    centerTitle: true,
    elevation: 7,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF1976D2),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(color: Colors.white),
    ),
  ),
);

//Color
Color primaryColor = Color(0xFF1976D2);
Color secondaryColor = Color(0xFF2196F3);


//ProfileView
double profileViewHorizontalPadding = 16;
double profileViewVerticalPadding = 15;
double cardRadius = 24;
double profileIconOuterSize = 90;
double profileIconSize = 75;
double profileViewButtonWidth = 220;

//Header Widget
double paddingBetweenText = 10;

//Info Card Widget
double infoCardWidgetVerticalPadding = 10;
double paddingBetweenIconText = 20;
double iconWidth = 22;
double infoWidgetCardTextSize = 20;

//TextField
double textFieldBottomPadding = 25;
double textFieldBorderRadius = 10;
double textFieldFontSize = 20;
double textFieldInBetweenSpace = 25;

//Edit Profile Screen
double editProfileTopPadding = 25;
double editProfileHorizontalPadding = 16;

//Bottom Navigation Bar
double bottomNavigationHorizontalPadding = 16;
double bottomNavigationVerticalPadding = 12;
double bottomNavigationButtonPadding = 32;
double buttonHeight = 50;
double buttonBorderRadius = 8;
double buttonBorderWidth = 1.5;
double buttonTextSize = 20;
