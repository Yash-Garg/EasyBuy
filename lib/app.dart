import 'package:easybuy/screens/login.dart';
import 'package:easybuy/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> _pages = [
  GetPage(
    name: '/register',
    page: () => RegistrationScreen(),
    transition: Transition.topLevel,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
    transition: Transition.topLevel,
    transitionDuration: Duration(milliseconds: 200),
  ),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EasyBuy',
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      getPages: _pages,
    );
  }
}
