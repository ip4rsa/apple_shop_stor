// ignore_for_file: deprecated_member_use

import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSourse {
  Future<List<Prodocts>> getProducts();
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
}
