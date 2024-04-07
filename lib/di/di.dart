import 'package:apple_shop/data/dataSource/authintication_source.dart';
import 'package:apple_shop/data/dataSource/banner_dataSourse.dart';
import 'package:apple_shop/data/dataSource/category_datasourse.dart';
import 'package:apple_shop/data/dataSource/product_datasorse.dart';
import 'package:apple_shop/data/repository/authintication_repository.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getInit() async {
  //componnets
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // Datasources
  locator
      .registerFactory<AutenticationDataSource>(() => AuthenticationRemote());
  locator.registerFactory<IcategoryDatasources>(() => CategoryDataSource());
  locator.registerFactory<IBannerDataSourse>(() => BannerRemotDataSourse());
  locator.registerFactory<IProductDataSourse>(() => ProductRemoteDaataSourse());

  //repository
  locator.registerFactory<IauthRepository>(() => AutenticationRepository());
  locator.registerFactory<IcategoryRepository>(() => CategoryRepository());
  locator.registerFactory<IBannerRepository>(() => BannerRepository());
  locator.registerFactory<IProductRepository>(() => ProductRepository());
}
