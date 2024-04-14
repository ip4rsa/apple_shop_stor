import 'package:apple_shop/data/model/products_image.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsState {}

class ProductInitState extends ProductDetailsState {}

class ProductDetaisLoadingState extends ProductDetailsState {}

class ProductDetailsResponseState extends ProductDetailsState {
  Either<String, List<ProductImage>> getProductImage;
  ProductDetailsResponseState(this.getProductImage);
}
