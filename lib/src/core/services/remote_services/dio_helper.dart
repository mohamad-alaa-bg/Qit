import 'package:dio/dio.dart';
import 'package:qit/src/core/resources/constants.dart';

class DioHelper {
  static Dio? dioLogin;
  static Dio? dioProducts;

  static init() {
    dioLogin = Dio(
      BaseOptions(
        baseUrl: loginBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );

    dioProducts = Dio(
      BaseOptions(
        baseUrl: productsBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<dynamic, dynamic> data,
    String? token,
  }) async {
    dioLogin!.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dioLogin!.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dioProducts!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dioProducts!.get(url);
  }
}
