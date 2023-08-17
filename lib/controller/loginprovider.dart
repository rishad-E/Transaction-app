
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:transaction_app/model/loginreqmodel.dart';
import 'package:transaction_app/service/loginservice.dart';
import 'package:transaction_app/view/home.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> loginFunProvider(context) async {
    isLoading = true;
    notifyListeners();

    final emailC = emailController.text.trim();
    final passwordC = passwordController.text.trim();
    LoginReqModel model = LoginReqModel(
        email: emailC, password: passwordC, returnSecureToken: true);
    await LoginService().loginFunService(model).then((value) => {
          if (value?.idToken != null)
            {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>const HomeScreen())),
              storage.write(key: 'accessToken', value: value?.idToken)
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('invalid username/password'),
                  backgroundColor: Color.fromARGB(255, 199, 44, 33),
                ),
              ),
              isLoading = false,
              notifyListeners()
            }
        });
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 5) {
      return 'Password must have atleast 6 character';
    } else if (value.length > 10) {
      return 'Password exceeds 10 character';
    }
    return null;
  }
}
