import 'dart:async';

import 'package:flutter/cupertino.dart';

enum BaseStatus { unknown, onProgress, onSuccess, onError, onWarning }

class BaseObservableObject {
  BaseObservableObject(
      {this.status = BaseStatus.unknown,
      this.message,
      this.isShowLoading = true,
      this.isShowDialogMessage,
      this.errorMess = ''});
  final BaseStatus status;
  final String? message;
  final bool isShowLoading;
  final bool? isShowDialogMessage;
  final String errorMess;
}

var baseController = StreamController<BaseObservableObject>.broadcast();

Stream<BaseObservableObject> get baseStream => baseController.stream;
bool isLoading = false;

class BaseObserver {
  void loading() {
    baseController.sink.add(BaseObservableObject(
      status: BaseStatus.onProgress,
    ));
  }

  void success({
    bool isShowDialogMessage = false,
    String message = '',
    bool isPopToParent = false,
  }) {
    baseController.sink.add(BaseObservableObject(
      status: BaseStatus.onSuccess,
      isShowDialogMessage: isShowDialogMessage,
      message: message,
    ));
  }

  void error({
    bool isShowDialogMessage = false,
    String message = '',
  }) {
    baseController.sink.add(BaseObservableObject(
        status: BaseStatus.onError,
        isShowDialogMessage: isShowDialogMessage,
        errorMess: message));
  }

  void warning({
    bool isShowDialogMessage = false,
    String message = '',
  }) {
    baseController.sink.add(BaseObservableObject(
        status: BaseStatus.onWarning,
        isShowDialogMessage: isShowDialogMessage,
        errorMess: message));
  }

  Stream<dynamic> callFunctionStream(
      {required Function() func, required BuildContext context}) async* {
    loading();
    try {
      await func();
    } catch (e) {
      error(message: e.toString());
    }
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    success(message: 'Finish');
  }

  Future<void> callFunctionFuture(
      {required Function() func, required BuildContext context}) async {
    loading();
    try {
      await func();
    } catch (e) {
      error(message: e.toString());
    }
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));

    success(message: 'Finish');
  }

  void close() {
    baseController.close();
  }
}

final baseObserverController = BaseObserver();
