import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/core/routes.dart';
import 'package:task_app/core/theme/light_theme.dart';

import 'binding/initial_binding.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      title: 'Flutter Demo',
      theme: light,
      initialBinding: InitialBinding(),
      getPages: Routes.routes,
      initialRoute: Routes.getHome(),
    );
  }
}
