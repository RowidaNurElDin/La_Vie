import 'package:flutter/material.dart';

class LoginModel{
  String? type;
  String? message;
  User? user;

  LoginModel.fromJson(Map<String , dynamic> json){
    type = json['type'];
    message = json['message'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
  }
}


class User{
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? accessToken;
  String? refreshToken;
  User.fromJson(Map<String , dynamic> json){
    id = json['user']['userId'];
    firstName = json['user']['firstName'];
    lastName = json['user']['lastName'];
    email = json['user']['email'];
    imageUrl = json['user']['imageUrl'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }


}


class FacebookUserModel{
  String? id;
  String? name;
  String? email;
  FacebookPictureModel? picture;

  FacebookUserModel.fromJson(Map<String , dynamic> json){
    id = json['id'] as String?;
    name = json['name'];
    email = json['email'];
    picture = FacebookPictureModel.fromJson(json['picture']['data']);
  }


}

class FacebookPictureModel{
  String? url ;

  FacebookPictureModel.fromJson(Map<String , dynamic> json){
    url = json['url'];
  }


}

