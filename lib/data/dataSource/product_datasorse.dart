// ignore_for_file: deprecated_member_use

import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSourse {
  Future<List<Prodocts>> getProducts();
  Future<List<Prodocts>> getHotest();
  Future<List<Prodocts>> getBestSeler();
}

class ProductRemoteDaataSourse extends IProductDataSourse {
  final Dio _dio = locator.get();
  @override
  Future<List<Prodocts>> getProducts() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data['items']
          .map<Prodocts>((jsonObject) => Prodocts.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'errore unKnow');
    }
  }

  @override
  Future<List<Prodocts>> getHotest() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Hotest"'};
      var response = await _dio.get('collections/products/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Prodocts>((jsonObject) => Prodocts.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'errore unKnow');
    }
  }

  @override
  Future<List<Prodocts>> getBestSeler() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};
      var response = await _dio.get('collections/products/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Prodocts>((jsonObject) => Prodocts.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'errore unKnow');
    }
  }
}
