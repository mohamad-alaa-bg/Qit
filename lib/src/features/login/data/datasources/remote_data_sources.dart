import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qit/src/core/resources/constants.dart';
import 'package:qit/src/core/services/remote_services/dio_helper.dart';
import 'package:qit/src/features/login/data/models/user_model.dart';

abstract class LoginRemoteDataSources{
  Future<UserModel?> login(String email,String password);
}

class LoginRemoteDataSourcesImp implements LoginRemoteDataSources{
  @override
  Future<UserModel?> login(String email, String password) async{
    try{
      Response response = await DioHelper.postData(url: loginPostUrl, data: {
        "email" : email,
        "password" : password,
      });

      return UserModel.fromJson(response.data['data']);
    }catch(error){
      throw Fail(error);
    }


  }
}