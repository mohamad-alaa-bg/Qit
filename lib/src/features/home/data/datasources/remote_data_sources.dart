import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qit/src/core/resources/constants.dart';
import 'package:qit/src/core/services/remote_services/dio_helper.dart';
import 'package:qit/src/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSources {
  Future<List<String>?> getCategories();
  Future<List<ProductModel>?> getProducts(String categoryName);
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  @override
  Future<List<String>?> getCategories() async {
    try {
      Response response = await DioHelper.getData(url: categoriesGetUrl);

      List<String> categories = [];

      response.data.forEach((element) {
        categories.add(element.toString());
      });
      return categories;
    } catch (error) {
      throw Fail(error);
    }
  }

  @override
  Future<List<ProductModel>?> getProducts(String categoryName) async{
    try {
      Response response = await DioHelper.getData(url: productsGetUrl + categoryName);


      List<ProductModel> products = [];

      response.data.forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      return products;
    } catch (error) {
      throw Fail(error);
    }
  }
}
