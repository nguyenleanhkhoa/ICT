import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsdailymobile/src/common/resource/color.resource.dart';

class Palatte {
  static ThemeData customTheme() {
    return ThemeData(
        primarySwatch: const MaterialColor(
          0xFFEF5350,
          <int, Color>{
            50: Color(0xFFFFEBEE),
            100: Color(0xFFFFCDD2),
            200: Color(0xFFEF9A9A),
            300: Color(0xFFE57373),
            400: Color(0xFFEF5350),
            500: Color(0xFFC62828),
            600: Color(0xFFE53935),
            700: Color(0xFFD32F2F),
            800: Color(0xFFC62828),
            900: Color(0xFFB71C1C),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Colors.blue,
        backgroundColor: Colors.white,
        disabledColor: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primary,
          brightness: Brightness.dark,
          systemOverlayStyle:
              SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white),
        ),

        // fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          headline6: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          button: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
          bodyText2: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          caption: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          subtitle1: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: AppColor.button,
            minWidth: 90,
            height: 46,
            textTheme: ButtonTextTheme.normal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColor.primary),
                overlayColor:
                    MaterialStateProperty.all<Color>(AppColor.primary),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColor.primary),
                shadowColor: MaterialStateProperty.all<Color>(AppColor.primary),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.grey, width: 1))),
          textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: Colors.blue)),
        )));
  }
}

class TextStyleCustom {
  const TextStyleCustom();

  static const TextStyle textTitleLogin = TextStyle(
      fontSize: 18,
      fontFamily: 'Roboto',
      color: Color.fromRGBO(1, 56, 142, 1),
      fontWeight: FontWeight.bold);

  static const TextStyle textForgetPassword = TextStyle(
      fontSize: 12,
      fontFamily: 'Roboto',
      color: Color.fromRGBO(196, 196, 196, 1),
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);

  static const TextStyle textTitleHome = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    color: AppColor.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle textTitleDashboard = TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textTitleHomeCardSmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto',
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textTitleAppBar = TextStyle(
      fontSize: 10,
      fontFamily: 'Roboto',
      color: AppColor.titleColorBar,
      fontWeight: FontWeight.bold);

  static const TextStyle linkTitle = TextStyle(
      fontSize: 12,
      fontFamily: 'Roboto',
      color: AppColor.linkTitle,
      fontWeight: FontWeight.bold);

  static const TextStyle websiteDetail = TextStyle(
      fontSize: 15,
      fontFamily: 'Roboto',
      color: AppColor.linkTitle,
      fontWeight: FontWeight.bold);

  static const TextStyle linkDes = TextStyle(
      fontSize: 12,
      fontFamily: 'Roboto',
      color: AppColor.linkDes,
      fontWeight: FontWeight.normal);

  static const TextStyle linkOwner = TextStyle(
      fontSize: 10,
      fontFamily: 'Roboto',
      color: AppColor.linkOwner,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300);

  static const TextStyle titleChart = TextStyle(
      fontSize: 10,
      fontFamily: 'Roboto',
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);

  static const TextStyle keyWebsite =
      TextStyle(fontSize: 12, fontFamily: 'Roboto', color: AppColor.linkOwner);

  static const TextStyle valueWebsite =
      TextStyle(fontSize: 12, fontFamily: 'Roboto', color: Colors.black);

  static const TextStyle textExpireBlue =
      TextStyle(fontSize: 12, fontFamily: 'Roboto', color: AppColor.expireBlue);
  static const TextStyle textExpireRed =
      TextStyle(fontSize: 12, fontFamily: 'Roboto', color: AppColor.expireRed);
  static const TextStyle textDetail = TextStyle(
    fontSize: 10,
    fontFamily: 'Roboto',
    color: AppColor.linkTitle,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
  );

  static const textProfile = TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      color: Colors.black,
      fontWeight: FontWeight.w500);
}
