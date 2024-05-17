import 'package:ecommerce_app/providers/user.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  bool isLogin = box.hasData(kUserInfo);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-commerce App",
        home: isLogin ? const HomeScreen() : const LoginScreen(),
        theme: ThemeData(),
      ),
    ),
  );
}
