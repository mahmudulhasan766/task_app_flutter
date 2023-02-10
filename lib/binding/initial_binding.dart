import 'package:get/get.dart';
import 'package:task_app/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(HomeController());
  }
}