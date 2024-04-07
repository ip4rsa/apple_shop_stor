import 'package:apple_shop/data/dataSource/product_datasorse.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<Prodocts>>> getProducts();
}

class ProductRepository extends IProductRepository {
  final IProductDataSourse _datasourse = locator.get();
  @override
  Future<Either<String, List<Prodocts>>> getProducts() async {
    try {
      var response = await _datasourse.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }
}
