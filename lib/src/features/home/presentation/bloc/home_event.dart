part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetCategoriesEvent extends HomeEvent{}
class SelectCategoryEvent extends HomeEvent{
  final int index;
  SelectCategoryEvent({required this.index});
}
class GetProductsEvent extends HomeEvent{
  final String categoryName;
  GetProductsEvent({required this.categoryName});
}
