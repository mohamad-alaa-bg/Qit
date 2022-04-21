
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';
import 'package:qit/src/features/home/domain/usecases/categories.dart';
import 'package:qit/src/features/home/domain/usecases/category.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CategoriesUseCase categoriesUseCase;
  final CategoryUseCases categoryUseCases;

  HomeBloc({required this.categoriesUseCase,required this.categoryUseCases}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        emit(CategoriesIsLoadingState());
        try {
          final categories = await categoriesUseCase(CategoriesParam());
          categories.fold((l) => emit(CategoriesErrorState()),
              (r) {
                emit(CategoriesSuccessState(categories: r));
                add(GetProductsEvent(categoryName: r[selectedCategories]));
              } );
        } catch (error) {
          emit(CategoriesErrorState());
        }
      }else if(event is SelectCategoryEvent){
        selectedCategories = event.index;
        emit(CategorySelectedState());

      }else if(event is GetProductsEvent){
        emit(ProductsIsLoadingState());
        try {
          if(allProducts[event.categoryName] == null){
            final products = await categoryUseCases(CategoryParam(categoryName: event.categoryName));
            products.fold((l) => emit(ProductsErrorState()),
                    (r) {
                  emit(ProductsSuccessState(products: r));
                  allProducts.addAll({event.categoryName:r});
                } );
          }else{
            emit(ProductsSuccessState(products: allProducts[event.categoryName]! ));
          }

        } catch (error) {
          emit(ProductsErrorState());
        }

      }
    });
  }

   int selectedCategories = 0;
   Map<String,List<ProductModel>> allProducts = {};
}
