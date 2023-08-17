import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import 'package:transaction_app/controller/loginprovider.dart';
import 'package:transaction_app/view/home.dart';
import 'package:transaction_app/view/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token = await storage.read(key: 'accessToken');
  runApp( MyApp(token: token,));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return FlutterSizer(
      builder: (p0, p1, p2) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LoginProvider(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: token != null ? const HomeScreen() : const LoginScreen(),
          ),
        );
      },
    );
  }
}
