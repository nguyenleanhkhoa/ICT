import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsdailymobile/src/bloc/base_bloc/base.bloc.dart';

import 'exception_handler.dart';

var bloc = BaseObserver();
Future<Response> doGet(String url,
    {Map<String, dynamic>? paramRequest, Map<String, String>? headers}) async {
  final String queryString = Uri(queryParameters: paramRequest).query;
  final requestUrl = '$url?$queryString';

  final Response response =
      await http.get(Uri.parse(requestUrl), headers: headers).timeout(
    const Duration(minutes: 5),
    onTimeout: () {
      throw FetchDataException('Error  while Communication with Server ', 500);
    },
  ).onError((error, stackTrace) {
    print('Đường truyền mạng đang gặp sự cố!');
    return Response('', 500);
  });
  return _response(response);
}

Future<Response> doPost(
  String url,
  String body, {
  Map<String, String>? headers,
}) {
  final postHeaders = {
    'Content-type': 'application/json',
  };
  if (headers != null) {
    postHeaders.addAll(headers);
  }

  return http.post(Uri.parse(url), body: body, headers: postHeaders);
}

class StatusCode {
  static const int successResponse = 200;
  static const int badRequest = 400;
  static const int unauthorization_403 = 403;
  static const int unauthorization_401 = 401;
  static const int errorServer = 500;
  static const int notFound = 404;
}

Response _response(Response response) {
  switch (response.statusCode) {
    case StatusCode.successResponse:
      return response;
    case StatusCode.badRequest:
      throw BadRequestException('Bad Request !', StatusCode.badRequest);
    case StatusCode.unauthorization_401:
    case StatusCode.unauthorization_403:
      throw UnauthorisedException(
          'Unauthorize !', StatusCode.unauthorization_403);
    case StatusCode.errorServer:

    default:
      throw FetchDataException('Error occured while Communication with Server ',
          StatusCode.errorServer);
  }
}
