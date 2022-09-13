import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie/Shared%20Prefrences/shared_pref.dart';

import '../Components.dart';

class DioHelper{

  static late Dio dio ;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com/api/v1/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
          'Accept':'application/json',
        }
      )
    );
  }

  static Future<Response> postData({
  required String endpoint,
    Map<String,dynamic>? queryParameters,
    required Map<String,dynamic> data
})async{
    dio.options.headers["Authorization"] = "Bearer " + token!;
    print(endpoint);
   // print(token);
    return dio.post(endpoint , data: data , queryParameters: queryParameters ,);

  }

  static Future<Response> loginPostData({
    required String endpoint,
    Map<String,dynamic>? queryParameters,
    required Map<String,dynamic> data
  })async{
    print(endpoint);
    // print(token);
    return dio.post(endpoint , data: data , queryParameters: queryParameters ,);

  }

  static Future<Response> getData({
    required String endpoint,
    Map<String,dynamic>? queryParameters,
    required Map<String,dynamic> data
  })async{
    return dio.get(endpoint , queryParameters: queryParameters);

  }

  static Future<Response> getDataWithoutParameters({
    required String endpoint,

  })async{
    dio.options.headers["Authorization"] = "Bearer " + token!;
    return await dio.get(endpoint );

  }

  static Future<Response> postDataWithoutParameters({
    required String endpoint,

  })async{
    dio.options.headers["Authorization"] = "Bearer " + token!;
    return await dio.post(endpoint );

  }


}