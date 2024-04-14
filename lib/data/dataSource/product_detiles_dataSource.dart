import 'package:apple_shop/data/model/products_image.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDataSource {
  Future<List<ProductImage>> getProductImage();
}

class DetalProductDataSource extends IDetailProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductImage>> getProductImage() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
      var response = await _dio.get('collections/gallery/records',
          queryParameters: qParams);
      return response.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
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
