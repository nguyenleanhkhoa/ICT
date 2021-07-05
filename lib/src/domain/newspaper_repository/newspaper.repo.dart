import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:newsdailymobile/src/common/Utils/http_common.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/config/hive_constant.dart';
import 'package:newsdailymobile/src/models/models.dart';

class NewspaperRepository {
  var authBox = Hive.box(boxAuth);
  Future<BaseResponseModel<LinkModel>> getNewspaperlates(
      {int? itemPerPage}) async {
    final User user = authBox.get(authLocalStorage) as User;
    // final dateFrom = DateTime.now().toString();
    // final dateTo = UtilsCommon.getDateBefore(10).toString();
    const dateFrom = '2020-06-01 01:33:42.553177';
    const dateTo = '2020-06-10 00:00:01.000';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    };
    final paramRequest = <String, dynamic>{
      r'date_from': dateFrom,
      r'date_to': dateTo,
      r'items_per_page': itemPerPage.toString(),
      r'page': '1',
      r'userid': user.id.toString(),
      r'token': user.token.toString(),
    };
    LinkModel listData = const LinkModel();
    final String url = '$urlApi/newspapers/latest';
    final response = await doGet(url, paramRequest: paramRequest);

    if (response.statusCode == StatusCode.successResponse) {
      listData = LinkModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);

      return BaseResponseModel<LinkModel>(
          statusCode: response.statusCode,
          result: listData,
          message: 'success');
    } else {
      return throw Exception(response.body);
    }
  }
}
