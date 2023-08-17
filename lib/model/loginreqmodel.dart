// To parse this JSON data, do
//
//     final loginReq = loginReqFromJson(jsonString);

import 'dart:convert';

LoginReqModel loginReqFromJson(String str) => LoginReqModel.fromJson(json.decode(str));

String loginReqToJson(LoginReqModel data) => json.encode(data.toJson());

class LoginReqModel {
    String? email;
    String? password;
    bool? returnSecureToken;

    LoginReqModel({
        this.email,
        this.password,
        this.returnSecureToken,
    });

    factory LoginReqModel.fromJson(Map<String, dynamic> json) => LoginReqModel(
        email: json["email"],
        password: json["password"],
        returnSecureToken: json["returnSecureToken"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "returnSecureToken": returnSecureToken,
    };
}
