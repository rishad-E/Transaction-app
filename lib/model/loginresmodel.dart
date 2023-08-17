// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    final String? kind;
    final String? localId;
    final String? email;
    final String? displayName;
    final String? idToken;
    final bool? registered;
    final String? refreshToken;
    final String? expiresIn;

    LoginResModel({
        this.kind,
        this.localId,
        this.email,
        this.displayName,
        this.idToken,
        this.registered,
        this.refreshToken,
        this.expiresIn,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
    };
}
