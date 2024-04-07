import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadind extends HomeState {}

class HomeResponse extends HomeState {
  Either<String, List<Banners>> banerList;
  Either<String, List<Categorys>> categoryList;
  Either<String, List<Prodocts>> productList;
  HomeResponse(this.banerList, this.categoryList, this.productList);
}
