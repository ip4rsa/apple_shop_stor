import 'package:apple_shop/data/model/Banner.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSourse {
  Future<List<Banners>> getBanners();
}

class BannerRemotDataSourse extends IBannerDataSourse {
  final Dio _dio = locator.get();
  @override
  Future<List<Banners>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items']
          .map<Banners>((jsonObject) => Banners.fromMapJson(jsonObject))
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
