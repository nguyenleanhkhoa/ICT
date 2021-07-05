import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:intl/intl.dart';
import 'package:newsdailymobile/src/bloc/base_bloc/base.bloc.dart';
import 'package:newsdailymobile/src/common/resource.dart';
import 'package:newsdailymobile/src/shared/widget/dialog.widget.dart';

const spinLoading = SpinKitFadingCircle(
  color: AppColor.button,
  size: 40.0,
);

var bloc = BaseObserver();

class UtilsCommon {
  static void showProcess(BuildContext context) {
    baseStream.listen((event) {
      if (event.isShowLoading) {
        if (event.status == BaseStatus.onProgress) {
          showDialog<dynamic>(
              barrierDismissible: false,
              context: context,
              builder: (context) => const AlertDialogMessage(
                    isLoading: true,
                  ));
        } else if (event.status == BaseStatus.onSuccess) {
          if (event.isShowLoading && Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
        } else if (event.status == BaseStatus.onError) {
          showDialog<dynamic>(
              context: context,
              builder: (context) => AlertDialogMessage(
                    subscription: event.errorMess,
                    isError: true,
                    isShowButtonAction: true,
                  ));
        } else if (event.status == BaseStatus.onWarning) {
          showDialog<dynamic>(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialogMessage(
                    subscription: event.errorMess,
                    isError: true,
                    isShowButtonAction: true,
                    okButton: true,
                    btnTitle: 'Thử lại',
                    onOkPressed: () async {
                      bloc.success();
                      // await UtilsCommon.checkConnectionNetWork();
                    },
                  ));
        }
      }
    });
  }
}

dynamic parseData(String response) {
  try {
    // ignore: avoid_dynamic_calls
    return json.decode(response).cast<Map<String, dynamic>>();
  } catch (ex) {
    return '';
  }
}

double initChart(Map<String, double> mapData) {
  return mapData.putIfAbsent('init', () => 0);
}

void removeInitChart(Map<String, double> mapData) {
  return mapData.clear();
}

bool checkDateTime(DateTime dateTime) {
  final int timeStamp = dateTime.millisecondsSinceEpoch;
  final int timeStampNow = DateTime.now().millisecondsSinceEpoch;
  return timeStampNow > timeStamp;
}

DateTime dateTimeToUTc(DateTime dateTime) {
  return dateTime.toUtc();
}

String getMessageError(String message) {
  final Map<String, dynamic> map = json.decode(message) as Map<String, dynamic>;
  return map['message'].toString();
}

String formatDDMMYY(DateTime dateTime) {
  final formatTmp = DateFormat('dd/MM/yyyy');
  return formatTmp.format(dateTime);
}

DateTime getDateBefore(int dayBefore) {
  final dateNow = DateTime.now();
  return DateTime(
      dateNow.year, dateNow.month, dateNow.day - dayBefore, 00, 00, 01);
}

bool checkHTML(String image) {
  return image.contains(RegExp(r'<[^>]*>'));
}
