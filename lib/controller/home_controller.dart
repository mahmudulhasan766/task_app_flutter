import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_app/core/help_me.dart';
import 'package:task_app/data/model/video_model.dart';
import 'package:task_app/repository/repository.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController{
  //late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;
  bool isStatus = true;
  bool isVolume = true;
  //VideoPlayerController? videoPlayerController;

  VideoModel videoModel= VideoModel();

  @override
  void onInit() {
    video();
   // initializePlayer( 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
   //  controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");



    super.onInit();
  }

  videoPausePlay(bool isStatus){
    isStatus = isStatus;
    update();
  }
  volumeMuteUnMute(bool isVolume){
    isVolume = isVolume;
    update();
  }
  // Future<VideoPlayerController?> initializePlayer(String videoUrl) async {
  //   videoPlayerController = VideoPlayerController.network(videoUrl);
  //   await videoPlayerController!.initialize();
  //   videoPlayerController!.setLooping(true);
  //   videoPlayerController!.setVolume(1.0);
  //   videoPlayerController!.play();
  //
  //   update();
  //   return videoPlayerController;
  // }

  Future video() async{
    printLog("----------");
    await Repository().getVideo().then((value){
      videoModel = value;
      // for(int i= 0;i<=value.length;i++){
      //   initializeVideoPlayerFuture = value.data![i].controller!.initialize();
      //   value.data![i].controller!.setLooping(isStatus);
      // }
      //return value;
    });
   update();
  }


  @override
  void onClose() {
    for(int i= 0;i<=videoModel.data!.length;i++){
      videoModel.data![i].controller.dispose();
    }
    super.onClose();
  }

}