import 'package:get/get.dart';
import 'package:task_app/feature/home/home_screen.dart';

class Routes {
  static const String home = '/home';

  static String getHome() => home;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
