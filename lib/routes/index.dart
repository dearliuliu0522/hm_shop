import 'package:flutter/material.dart';
import 'package:hm_shop/pages/login/index.dart';
import 'package:hm_shop/pages/main/index.dart';

Widget getRootWidget() {
  return MaterialApp(initialRoute: "/", routes: _getRootRoutes());
}

Map<String, Widget Function(BuildContext)> _getRootRoutes() {
  return {"/": (context) => MainPage(), "/login": (context) => LoginPage()};
}
