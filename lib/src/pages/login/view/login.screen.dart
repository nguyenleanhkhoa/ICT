import 'package:flutter/material.dart';
import 'package:newsdailymobile/src/bloc/base_bloc/base.bloc.dart';
import 'package:newsdailymobile/src/common/resource/image.resource.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/domain/auth_repository/auth.repo.dart';
import 'package:newsdailymobile/src/models/base_model/base.model.dart';
import 'package:newsdailymobile/src/pages/home/view/home.screen.dart';
import 'package:newsdailymobile/src/pages/login/widget/login.widget.dart';
import 'package:flutter/scheduler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routing = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  bool isPasswordSecured = true;
  final bloc = BaseObserver();
  late AuthRepository _authRepository;

  void callFunction() {
    print("callback");
  }

  @override
  void initState() {
    _authRepository = AuthRepository();
    emailEditingController = TextEditingController(text: username);
    passwordEditingController = TextEditingController(text: password);
    WidgetsBinding.instance!.addPostFrameCallback((_) => callFunction());
    super.initState();
  }

  Future<void> doLogin(String username, String password) async {
    try {
      await bloc.callFunctionFuture(
          func: () async {
            final BaseResponseModel response = await _authRepository.login(
                emailEditingController.text, passwordEditingController.text);
            if (response.statusCode == 200) {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routing);
            }
          },
          context: context);
    } catch (e) {
      // _view.errorAction('Lỗi: ' + CommonUltils.getMessageError(e.message));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    print('render build');
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imageLogo,
                          width: 230,
                          height: 126,
                        ),
                        Text(
                            'SỞ THÔNG TIN VÀ TRUYỀN THÔNG\nTHÀNH PHỐ HỒ CHÍ MINH',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4),
                        const SizedBox(
                          height: 40.0,
                        ),
                        EmailFormField(
                          textEditingController: emailEditingController,
                        ),
                        PasswordFormField(
                          textEditingController: passwordEditingController,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonSubmit(
                          onPressed: () {
                            doLogin(emailEditingController.text,
                                passwordEditingController.text);
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                //
                              },
                              child: Text('Quên mật khẩu?',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle1),
                            )
                          ],
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
