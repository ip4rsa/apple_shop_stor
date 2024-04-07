import 'package:apple_shop/bloc/categorys/categort_event.dart';
import 'package:apple_shop/bloc/categorys/categorys_state.dart';
import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class CategorysBloc extends Bloc<CategoryEvent, CategoryState> {
  final IcategoryRepository _repository = locator.get();
  CategorysBloc() : super(CategoryInitioalState()) {
    on<GetListCategorys>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
