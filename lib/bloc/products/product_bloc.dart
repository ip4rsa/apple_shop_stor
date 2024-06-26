import 'package:apple_shop/Screens/product_detail_screen.dart';
import 'package:apple_shop/bloc/products/product_event.dart';
import 'package:apple_shop/bloc/products/product_state.dart';
import 'package:apple_shop/data/repository/product_detai_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final IDtailProductRepository _dtailProductRepository = locator.get();
  ProductDetailsBloc() : super(ProductInitState()) {
    on<InitionalProductEvens>((event, emit) async {
      emit(ProductDetaisLoadingState());
      var productImage = await _dtailProductRepository.getProductImage();
      var productVariant = await _dtailProductRepository.getProductVariant();
      emit(ProductDetailsResponseState(productImage, productVariant));
    });
  }
}
