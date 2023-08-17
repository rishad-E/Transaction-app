import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:transaction_app/constants/apiconstants.dart';
import 'package:transaction_app/model/loginreqmodel.dart';
import 'package:transaction_app/model/loginresmodel.dart';

class LoginService {
  Dio dio = Dio();

  Future<LoginResModel?> loginFunService(LoginReqModel model) async {
    String path = ApiConstants.loginApi;
    try {
      Response response =
          await dio.post(path, data: jsonEncode(model.toJson()));

      if (response.statusCode == 200) {
        LoginResModel res = LoginResModel.fromJson(response.data);
        log(response.toString());

        return res;
      }
    } on DioException catch (e) {
      log(e.toString(), name: "service login");
    }
    return null;
  }
}
