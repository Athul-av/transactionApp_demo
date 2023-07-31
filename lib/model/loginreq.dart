// To parse this JSON data, do
//
//     final loginReq = loginReqFromJson(jsonString);

import 'dart:convert';

LoginReq loginReqFromJson(String str) => LoginReq.fromJson(json.decode(str));

String loginReqToJson(LoginReq data) => json.encode(data.toJson());

class LoginReq {
    String? email;
    String? password;
    bool? returnSecureToken;

    LoginReq({
        this.email,
        this.password,
        this.returnSecureToken,
    });

    factory LoginReq.fromJson(Map<String, dynamic> json) => LoginReq(
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
