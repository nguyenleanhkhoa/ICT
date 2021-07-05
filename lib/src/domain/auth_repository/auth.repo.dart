import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:newsdailymobile/src/common/Utils/http_common.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/config/hive_constant.dart';
import 'package:newsdailymobile/src/models/models.dart';

class AuthRepository {
  Future<BaseResponseModel> login(String email, String password) async {
    final box = Hive.box(boxAuth);
    BaseResponseModel resultAuth;
    final userObject = {'email': email, 'password': password};
    final dataReq = {'user': userObject};
    final Response resp =
        await doPost('$urlApi/users/login', json.encode(dataReq));
    if (resp.statusCode == 200) {
      final userAuth =
          UserAuth.fromJson(json.decode(resp.body) as Map<String, dynamic>);

      resultAuth = BaseResponseModel(
          result: userAuth, statusCode: resp.statusCode, message: 'success!');
      await box.put(authLocalStorage, userAuth.user);
      return resultAuth;
    }
    return BaseResponseModel(statusCode: 400, message: 'Error http request');
  }

  Future<void> logout() {
    throw UnimplementedError();
  }

  Future<void> register() {
    throw UnimplementedError();
  }
}
