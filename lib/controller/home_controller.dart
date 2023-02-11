import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_app/data/model/video_model.dart';
import 'package:task_app/repository/repository.dart';

class HomeController extends GetxController{
  bool isStatus = true;
  bool isVolume = true;

  VideoModel videoModel= VideoModel();

  @override
  void onInit() {
    video();
    super.onInit();
  }

  videoPausePlay(bool isStatus){
    isStatus = isStatus;
    update();
  }

  Future video() async{
    await Repository().getVideo().then((value){
      videoModel = value;
    });
   update();
  }
}