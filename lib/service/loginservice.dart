import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:machine_test1/constant/constants.dart';
import 'package:machine_test1/model/loginreq.dart';
import 'package:machine_test1/model/loginresponse.dart';

class LoginService{
  Dio dio = Dio();

  Future<LoginResponse?> login(LoginReq model)async{

    String path = ApiConstants.loginapi;

    try {

      Response response = await dio.post(path,data: jsonEncode(model.toJson()));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final LoginResponse json = LoginResponse.fromJson(response.data);
        return json;
      }
      
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}