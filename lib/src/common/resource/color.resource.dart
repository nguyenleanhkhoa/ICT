import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFEF5350);

  static const Color focusInput = Color(0xFFEF5350);
  static const Color button = Color(0xFFEF5350);

  static const Color white = Color(0xFFf0f1f6);
  static const Color titleColor = Color(0xFF061857);
  static const Color headerColor = Color.fromRGBO(232, 80, 91, 5);
  static const Color titleColorBar = Color.fromRGBO(66, 133, 188, 5);

  static const Color footerCardDashboard = Color.fromRGBO(82, 55, 255, 5);
  static const Color headerCardDashboard = Color.fromRGBO(5, 213, 255, 5);

  static const Color footerCardToolDashboard = Color.fromRGBO(255, 47, 24, 5);
  static const Color headerCardToolDashboard = Color.fromRGBO(254, 0, 87, 5);

  static const Color footerCardReportDashboard =
      Color.fromRGBO(128, 60, 204, 5);
  static const Color headerCardReportDashboard =
      Color.fromRGBO(232, 42, 255, 5);

  static const Color linkTitle = Color.fromRGBO(66, 133, 188, 5);
  static const Color linkDes = Color.fromRGBO(0, 0, 0, 5);
  static const Color linkOwner = Color.fromRGBO(138, 138, 138, 5);
  static const Color expireBlue = Color.fromRGBO(6, 164, 50, 5);
  static const Color expireRed = Color.fromRGBO(232, 80, 91, 5);
  static const Color borderItemListView = Color.fromRGBO(236, 236, 236, 5);

  static const Color colorFooter = Color.fromRGBO(242, 242, 242, 5);

  static const List<Color> listColorPieChart = [
    Color.fromRGBO(33, 150, 243, 5),
    Color.fromRGBO(248, 65, 61, 5),
  ];

  static const primaryGradient = LinearGradient(
    colors: [Color(0xFFf6501c), Color(0xFFff7e00)],
    stops: [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
