import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:newsdailymobile/src/bloc/base_bloc/base.bloc.dart';
import 'package:newsdailymobile/src/common/Utils/http_common.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/config/hive_constant.dart';
import 'package:newsdailymobile/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinkRepository {
  var bloc = BaseObserver();
  var authBox = Hive.box(boxAuth);
  Future<BaseResponseModel<LinkModel>> getLinkLates(
      {int? groupWebsiteId, int? numberPage}) async {
    final User user = authBox.get(authLocalStorage) as User;
    // final dateFrom = DateTime.now().toString();
    // final dateTo = UtilsCommon.getDateBefore(10).toString();
    const dateFrom = '2019-06-22T03:01:18.853Z';
    const dateTo = '2019-06-24T03:01:18.853Z';
    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ${user.token}',
    // };
    final paramRequest = <String, dynamic>{
      r'group_website_id': groupWebsiteId.toString(),
      r'date_from': dateFrom,
      r'date_to': dateTo,
      r'items_per_page': numberPage.toString(),
      r'page': '1',
      r'userid': user.id.toString(),
      r'token': user.token.toString(),
    };

    LinkModel listData = const LinkModel();
    final String url = '$urlApi/links/group_websites/latest';
    final response = await doGet(url, paramRequest: paramRequest);
    await Future.delayed(const Duration(milliseconds: 1000));
    if (response.statusCode == 200) {
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
