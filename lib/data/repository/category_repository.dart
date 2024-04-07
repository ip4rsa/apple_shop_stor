import 'package:apple_shop/data/dataSource/category_datasourse.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IcategoryRepository {
  Future<Either<String, List<Categorys>>> getCategories();
}

class CategoryRepository extends IcategoryRepository {
  final IcategoryDatasources _dataSource = locator.get();
  @override
  Future<Either<String, List<Categorys>>> getCategories() async {
    try {
      var response = await _dataSource.getCategorys();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }
}
