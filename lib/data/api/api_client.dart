//apiclient for server communication
// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../../utils/utilities.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseUrl;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.token;
    _mainHeaders = {
      'Content-type ':
          ' application/json; charset=UTF-8', // get or post -> send the json format
      'Authorization':
          'Bearer $token', //if you make a lot of post requests in that case you should send tokens
    };
  }

  // Response from Getx
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(
        statusCode: 1,
        statusText: e.toString(),
      );
    }
  }
}
