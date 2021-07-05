import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/common/resource.dart';

@immutable
class EmailFormField extends StatefulWidget {
  const EmailFormField({
    Key? key,
    this.textEditingController,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  @override
  _EmailFormFieldState createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        decoration: const InputDecoration(
            labelText: 'Email',
            hoverColor: AppColor.focusInput,
            focusColor: AppColor.focusInput,
            prefixIcon: Icon(
              Icons.email,
              // color: AppColor.focusInput,
            )),
        obscureText: false);
  }
}

@immutable
class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    this.textEditingController,
    this.onChanged,
  }) : super(key: key);
  final Function(String)? onChanged;

  final TextEditingController? textEditingController;
  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isPasswordSecured = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordSecured = !isPasswordSecured;
                  });
                },
                icon: isPasswordSecured
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off))),
        obscureText: isPasswordSecured);
  }
}

@immutable
class ButtonSubmit extends StatefulWidget {
  const ButtonSubmit({Key? key, this.onPressed}) : super(key: key);
  final Function()? onPressed;

  @override
  _ButtonSubmitState createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(12.0),
      color: const Color.fromRGBO(232, 80, 91, 5),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: widget.onPressed,
        child: Text('Đăng nhập',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
