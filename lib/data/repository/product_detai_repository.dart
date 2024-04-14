import 'package:apple_shop/data/dataSource/product_detiles_dataSource.dart';
import 'package:apple_shop/data/model/products_image.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDtailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
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
}
