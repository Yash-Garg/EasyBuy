import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> _pages = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EasyBuy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: _pages,
    );
  }
}
