import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IcategoryDatasources {
  Future<List<Categorys>> getCategorys();
}

class CategoryDataSource extends IcategoryDatasources {
  final Dio _dio = locator.get();
  @override
  Future<List<Categorys>> getCategorys() async {
    try {
      var response = await _dio.get('collections/category/records');
      return response.data['items']
          .map<Categorys>((jsonObject) => Categorys.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(0, 'unKnow');
    }
  }
}
