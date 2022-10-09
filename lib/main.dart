import 'package:faux_admin/app/module/spalsh_view/view/slashview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
