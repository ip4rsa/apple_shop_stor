import 'package:apple_shop/data/dataSource/banner_dataSourse.dart';
import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<String, List<Banners>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  final IBannerDataSourse _dataSourse = locator.get();
  @override
  Future<Either<String, List<Banners>>> getBanners() async {
    try {
      var response = await _dataSourse.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'خطا محتوای متنی ندارد');
    }
  }
}
