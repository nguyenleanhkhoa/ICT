import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/common/resource/color.resource.dart';
import 'package:newsdailymobile/src/models/screen_model/summary_screen.model.dart';

BoxDecoration decorationDashboard = const BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColor.headerCardDashboard, AppColor.footerCardDashboard],
  ),
);

BoxDecoration decorationToolDashboard = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColor.headerCardToolDashboard,
          AppColor.footerCardToolDashboard
        ]));

BoxDecoration decorationReportDashboard = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColor.headerCardReportDashboard,
          AppColor.footerCardReportDashboard
        ]));

BoxDecoration decorationHomeSmallDashboard = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColor.headerCardDashboard, AppColor.footerCardDashboard]));

List<Widget> renderTabBar(BuildContext context, List<TabScreenModel> tabName) {
  final List<Widget> list = [];
  for (int i = 0; i < tabName.length; i++) {
    list.add(
      Tab(
        child: FittedBox(
          child: Text(
            tabName[i].title,
          ),
        ),
      ),
    );
  }
  return list;
}

class DropDownButtonOnlyTextWidget extends StatefulWidget {
  DropDownButtonOnlyTextWidget(
      {Key? key,
      required this.selectedItem,
      required this.listItem,
      required this.title,
      required this.initValue,
      required this.onChanged})
      : super(key: key);
  final dynamic selectedItem;
  final dynamic initValue;
  final List<dynamic>? listItem;
  final String? title;
  void Function(dynamic)? onChanged;
  @override
  _DropDownButtonOnlyTextWidgetState createState() =>
      _DropDownButtonOnlyTextWidgetState();
}

class _DropDownButtonOnlyTextWidgetState<T>
    extends State<DropDownButtonOnlyTextWidget> {
  @override
  Widget build(BuildContext context) {
    dynamic val;
    if (widget.selectedItem != null &&
        widget.selectedItem.toString().isNotEmpty) {
      val = widget.selectedItem;
    } else {
      val = widget.initValue;
    }

    return DropdownButton<dynamic>(
      menuMaxHeight: 200.0,
      value: val,
      onChanged: (newValue) {
        widget.onChanged!(newValue);
      },
      items: widget.listItem!.map((user) {
        return DropdownMenuItem<dynamic>(
          value: user,
          child: Text(
            user.toString(),
            style: const TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }
}
