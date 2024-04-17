import 'package:apple_shop/data/model/product_variant.dart';
import 'package:apple_shop/data/model/products_image.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsState {}

class ProductInitState extends ProductDetailsState {}

class ProductDetaisLoadingState extends ProductDetailsState {}

class ProductDetailsResponseState extends ProductDetailsState {
  Either<String, List<ProductImage>> getProductImage;
  Either<String, List<ProductVariant>> getVariant;
  ProductDetailsResponseState(this.getProductImage, this.getVariant);
}
