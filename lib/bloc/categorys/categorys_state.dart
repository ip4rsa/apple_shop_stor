import 'package:apple_shop/data/model/category.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryState {}

class CategoryInitioalState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Categorys>> response;
  CategoryResponseState(this.response);
}
