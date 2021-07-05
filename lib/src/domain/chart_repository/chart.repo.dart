import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:newsdailymobile/src/common/Utils/http_common.dart';
import 'package:newsdailymobile/src/config/global_constant.dart';
import 'package:newsdailymobile/src/config/hive_constant.dart';
import 'package:newsdailymobile/src/models/models.dart';

class ChartRepository {
  Future<BaseResponseModel<LicenseChartModel>> getLicenseNotExpired(
      {int? groupWebsiteId}) async {
    final box = Hive.box(boxAuth);
    final User user = box.get(authLocalStorage) as User;
    BaseResponseModel<LicenseChartModel> result;
    final userObject = {};
    final dataReq = {
      r'group_website_id': groupWebsiteId.toString(),
      r'userid': user.id.toString(),
      r'token': user.token.toString(),
    };
    final Response resp =
        await doGet('$urlApi/websites/is_live/summary', paramRequest: dataReq);
    if (resp.statusCode == 200) {
      final chart = LicenseChartModel.fromJson(
          json.decode(resp.body)['website'] as Map<String, dynamic>);

      result = BaseResponseModel<LicenseChartModel>(
          result: chart, statusCode: resp.statusCode, message: 'success!');
      return result;
    }
    return BaseResponseModel(statusCode: 400, message: 'Error http request');
  }
}
