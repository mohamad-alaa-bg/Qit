
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
            print(r);
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
          final products = await categoryUseCases(CategoryParam(categoryName: event.categoryName));
          products.fold((l) => emit(ProductsErrorState()),
                  (r) {
                print(r);
                emit(ProductsSuccessState(products: r));
              } );
        } catch (error) {
          emit(ProductsErrorState());
        }

      }
    });
  }

   int selectedCategories = 0;
}
