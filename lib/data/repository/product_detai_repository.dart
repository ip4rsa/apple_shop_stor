import 'package:apple_shop/data/dataSource/product_detiles_dataSource.dart';
import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/model/products_image.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDtailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
  Future<Either<String, List<VariantTyoe>>> getVariantType();
  Future<Either<String, List<ProductVariant>>> getProductVariant();
}

class DetailProductRepository extends IDtailProductRepository {
  final IDetailProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    try {
      var response = await _dataSource.getProductImage();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantTyoe>>> getVariantType() async {
    try {
      var response = await _dataSource.getVariantType();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariant() async {
    try {
      var response = await _dataSource.getProductVariant();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }
}
