import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:machine_test1/constant/constants.dart';
import 'package:machine_test1/model/transactionresponse.dart';

class TransactionService {

  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();

 Future<TransactionRes?> getdata(String token)async{
   
  String path = ApiConstants.transactions;
  Options options = Options(headers: {'authtoken':token});

  try {

    Response res = await dio.get(path,options:options ); 
    if (res.statusCode == 200 || res.statusCode == 201) {
      final json = res.data;
      final TransactionRes data = TransactionRes.fromJson(json);
      return data; 
    }
    
  }on DioException catch (e) {
    log(e.message.toString());
     await storage.delete(key:'accessToken'); 
     return null;     
  }
  return null; 

 }
}