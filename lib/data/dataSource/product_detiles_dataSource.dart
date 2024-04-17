import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/model/products_image.dart';
import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDataSource {
  Future<List<ProductImage>> getProductImage();
  Future<List<VariantTyoe>> getVariantType();
  Future<List<Variant>> getVariants();
  Future<List<ProductVariant>> getProductVariant();
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

  @override
  Future<List<VariantTyoe>> getVariantType() async {
    try {
      var response = await _dio.get('collections/variants_type/records');
      return response.data['items']
          .map<VariantTyoe>((jsonObject) => VariantTyoe.fromJson(jsonObject))
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

  @override
  Future<List<Variant>> getVariants() async {
    Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};
    try {
      var response = await _dio.get('collections/variants/records');
      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
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

  @override
  Future<List<ProductVariant>> getProductVariant() async {
    var variantType = await getVariantType();
    var variantList = await getVariants();

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantType) {
      var myVariantList = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();

      productVariantList.add(ProductVariant(myVariantList, variantType));
    }
    return productVariantList;
  }
}
