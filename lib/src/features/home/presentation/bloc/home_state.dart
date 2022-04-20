part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesIsLoadingState extends HomeState {}

class CategoriesSuccessState extends HomeState {
  final List<String> categories;

  CategoriesSuccessState({required this.categories});
}

class CategoriesErrorState extends HomeState {}

class CategorySelectedState extends HomeState {}

class CategorySelectErrorState extends HomeState {}


class ProductsIsLoadingState extends HomeState {}

class ProductsSuccessState extends HomeState {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}
class ProductsErrorState extends HomeState {}
