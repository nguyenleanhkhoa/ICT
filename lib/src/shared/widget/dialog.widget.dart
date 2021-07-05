import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/common/Utils/utils_common.dart';

@immutable
class AlertDialogMessage extends StatelessWidget {
  const AlertDialogMessage(
      {Key? key,
      this.tilte,
      this.isError = false,
      this.isSuccess = false,
      this.isLoading = false,
      this.subscription,
      this.isShowButtonAction = false,
      this.okButton = false,
      this.btnTitle = 'Đồng ý',
      this.onOkPressed})
      : super(key: key);

  final String? tilte;
  final String? subscription;
  final bool? isError;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? isShowButtonAction;
  final bool? okButton;
  final String? btnTitle;
  final Function()? onOkPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      // title: Text(tilte == null ? '' : tilte),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          showError(),
          showLoading(),
          showSuccess(tilte.toString().isEmpty ? '' : tilte.toString()),
          showDescription(
              subscription.toString().isEmpty ? '' : subscription.toString()),
          showActionButton(context),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget showError() {
    return (isError != null &&
            (tilte != null || subscription != null || !isLoading!))
        ? Column(
            children: const [
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          )
        : const SizedBox();
  }

  Widget showActionButton(context) {
    return (isShowButtonAction == true &&
            (tilte.toString().isNotEmpty || subscription.toString().isNotEmpty))
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              if (okButton!)
                GestureDetector(
                    onTap: onOkPressed,
                    child: Container(
                      width: 100.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          btnTitle.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
            ],
          )
        : const SizedBox();
  }

  Widget showDescription(String title) {
    return (title.isNotEmpty && title != '' && !isLoading!)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget showLoading() {
    return (isLoading != null) ? spinLoading : const SizedBox();
  }

  Widget showSuccess(String title) {
    return (isSuccess != null && !isLoading!)
        ? Column(
            children: const [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          )
        : const SizedBox();
  }
}
