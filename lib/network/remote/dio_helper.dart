import 'package:alhayaa_news_app/network/remote/end_points.dart';
import 'package:alhayaa_news_app/shared/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.baseUrl}$endPoint',
        queryParameters: query,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppConstants.NEWS_API_KEY}',
          },
        ),
      );
      return response;
    } catch (e) {
      debugPrint('Error in Dio getData() ===> $e');
      rethrow;
    }
  }
}
