import 'package:dartz/dartz.dart';
import 'package:qit/src/features/home/data/datasources/remote_data_sources.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';
import 'package:qit/src/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final HomeRemoteDataSources homeRemoteDataSources;
  HomeRepoImpl({required this.homeRemoteDataSources});
  @override
  Future<Either<Fail, List<String>>> getCategories() async{
    try{
      List<String>? categories = await homeRemoteDataSources.getCategories();
      if(categories != null){
        return Right(categories);
      }
      else{
        return Left(Fail('empty list'));
      }
    }catch(error){
      return Left(Fail(error));

    }
  }

  @override
  Future<Either<Fail, List<ProductModel>>> getProducts(String categoryName) async{
    try{
      List<ProductModel>? products = await homeRemoteDataSources.getProducts(categoryName);
      if(products != null){
        return Right(products);
      }
      else{
        return Left(Fail('empty list'));
      }
    }catch(error){
      return Left(Fail(error));

    }
  }

}