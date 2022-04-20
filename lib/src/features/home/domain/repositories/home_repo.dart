import 'package:dartz/dartz.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';

abstract class HomeRepo {

  Future<Either<Fail,List<String>>> getCategories();
  Future<Either<Fail,List<ProductModel>>> getProducts(String categoryName);
}