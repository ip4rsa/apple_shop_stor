import 'package:apple_shop/data/dataSource/authintication_source.dart';
import 'package:apple_shop/di/di.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/util/auth_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IauthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

class AutenticationRepository extends IauthRepository {
  final AutenticationDataSource _datasource = locator.get();
  final SharedPreferences _sharedpref = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.register('oiufyt', '11111111', '11111111');
      return right('ثبت نام شما با موفقیت انجام شد');
    } on ApiException catch (ex) {
      return left(ex.eroreMessage ?? 'Null!!!');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right('با موفقیت وارد شدید');
      } else {
        return left('خطایی رخ داد');
      }
    } on ApiException catch (ex) {
      return left('${ex.eroreMessage}');
    }
  }
}
