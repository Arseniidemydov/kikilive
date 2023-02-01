// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color primaryBtnText;
  late Color lineColor;
  late Color icons;
  late Color grayIcon;
  late Color button;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;
  late Color backgroundComponents;
  late Color maximumBlueGreen;
  late Color plumpPurple;
  late Color platinum;
  late Color ashGray;
  late Color darkSeaGreen;
  late Color btnText;
  late Color customColor3;
  late Color customColor4;
  late Color white;
  late Color background;
  late Color backgroundChat;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFD0BCFF);
  late Color secondaryColor = const Color(0xFF4F378B);
  late Color tertiaryColor = const Color(0xFFEADDFF);
  late Color alternate = const Color(0xFFE6E1E5);
  late Color primaryBackground = const Color(0xFFF5F5F5);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF1C1B1F);
  late Color secondaryText = const Color(0xA595A1AC);

  late Color primaryBtnText = Color(0xA51C1B1F);
  late Color lineColor = Color(0xFF938F99);
  late Color icons = Color(0xFFE6E1E5);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color button = Color(0xFF52489C);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFFFFFBFE);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color textColor = Color(0xA51C1B1F);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color maximumBlueGreen = Color(0xFF59C3C3);
  late Color plumpPurple = Color(0xFF52489C);
  late Color platinum = Color(0xFFEBEBEB);
  late Color ashGray = Color(0xFFCAD2C5);
  late Color darkSeaGreen = Color(0xFF84A98C);
  late Color btnText = Color(0xFFFFFFFF);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFFFFFBFE);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFFFFFBFE);
  late Color backgroundChat = Color(0xB3FFFFFF);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Roboto';
  TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
  String get title2Family => 'Roboto';
  TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 22,
      );
  String get title3Family => 'Roboto';
  TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  String get subtitle1Family => 'Roboto';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      );
  String get subtitle2Family => 'Roboto';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText1Family => 'Roboto';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  String get bodyText2Family => 'Roboto';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFD0BCFF);
  late Color secondaryColor = const Color(0xFF4F378B);
  late Color tertiaryColor = const Color(0xFFCAC4D0);
  late Color alternate = const Color(0xFFCCC2DC);
  late Color primaryBackground = const Color(0xFF1C1B1F);
  late Color secondaryBackground = const Color(0xFF49454F);
  late Color primaryText = const Color(0xFFE6E1E5);
  late Color secondaryText = const Color(0xFFCAC4D0);

  late Color primaryBtnText = Color(0xFFFFFFFF);
  late Color lineColor = Color(0xFFCAC4D0);
  late Color icons = Color(0xFF452FB7);
  late Color grayIcon = Color(0xFF95A1AC);
  late Color button = Color(0xFFD0BCFF);
  late Color gray600 = Color(0xFF262D34);
  late Color black600 = Color(0xFF090F13);
  late Color tertiary400 = Color(0xFF39D2C0);
  late Color textColor = Color(0xFF1E2429);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color maximumBlueGreen = Color(0xFF59C3C3);
  late Color plumpPurple = Color(0xFF52489C);
  late Color platinum = Color(0xFFEBEBEB);
  late Color ashGray = Color(0xFFCAD2C5);
  late Color darkSeaGreen = Color(0xFF84A98C);
  late Color btnText = Color(0xFFFFFFFF);
  late Color customColor3 = Color(0xFFDF3F3F);
  late Color customColor4 = Color(0xFF090F13);
  late Color white = Color(0xFFFFFFFF);
  late Color background = Color(0xFF1D2429);
  late Color backgroundChat = Color(0xB3000000);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
