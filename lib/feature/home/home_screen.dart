import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_app/controller/home_controller.dart';
import 'package:task_app/core/help_me.dart';
import 'package:task_app/utils/images.dart';
import 'package:video_player/video_player.dart';

import '../../utils/styles.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({Key? key}) : super(key: key);

  // final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFE6EEFA), //<-- SEE HERE
            child: IconButton(
              icon: SvgPicture.asset(Images.camera),
              onPressed: () {},
            ),
          ),
        ),
        title: Center(
          child: Text("Explore",
            style: poppinsSemiBold.copyWith(color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFFE6EEFA), //<-- SEE HERE
              child: IconButton(
                icon: SvgPicture.asset(Images.notification),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      body: GetBuilder<HomeController>(
        builder: (myController){
          return myController.videoModel.data!=null? ListView.builder(
            itemCount: myController.videoModel.data!.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Container(
                    //height: 345,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color(0xFFDBFFEE),
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0,left: 15,top: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(myController.videoModel.data![index].caption.toString(),
                                  style: poppinsRegular.copyWith(
                                      fontSize: 15,
                                      color: const Color(0xff000000)
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text( DateFormat('h:mm a').format(DateTime.parse(myController.videoModel.data![index].createdAt.toString())),
                                      style: poppinsRegular.copyWith(
                                          fontSize: 15,
                                          color: const Color(0xff6C7A9C)
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 268,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child:
                                    // VideoItem(
                                    //   videoPlayerController: VideoPlayerController.network("https://hajjmanagment.online/get/video/others/1675227540483-213848212.mp4"),
                                    //   looping: false,
                                    //   autoplay: false,
                                    // )
                                    FutureBuilder(
                                      future: myController.videoModel.data![index].initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          return AspectRatio(
                                            aspectRatio: myController.videoModel.data![index].controller.value.aspectRatio,
                                            child: VideoPlayer(myController.videoModel.data![index].controller),
                                          );
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 268,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 45,
                                        alignment: Alignment.bottomRight,
                                        padding: const EdgeInsets.only(right: 12),
                                        child: InkWell(
                                          onTap: (){

                                            if(myController.isVolume){
                                              Get.find<HomeController>().volumeMuteUnMute(false);
                                              myController.videoModel.data![index].controller.value.isLooping;
                                            }else{
                                              Get.find<HomeController>().volumeMuteUnMute(true);
                                              myController.videoModel.data![index].controller.setVolume(1);

                                            }
                                            printLog(Get.find<HomeController>().isVolume);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Get.find<HomeController>().isVolume ?
                                            SvgPicture.asset(Images.soundUnMute):
                                            SvgPicture.asset(Images.soundMute),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          if (myController.videoModel.data![index].controller.value.isPlaying) {
                                            myController.videoModel.data![index].controller.pause();
                                            myController.videoPausePlay(true);
                                          } else {
                                            myController.videoModel.data![index].controller.play();
                                            myController.videoPausePlay(false);
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Get.find<HomeController>().videoModel.data![index].controller.value.isPlaying ?
                                          SvgPicture.asset(Images.pause)
                                              :SvgPicture.asset(Images.play),
                                        ),
                                      ),
                                      const SizedBox(height: 45,),
                                    ],
                                  ),
                                ),

                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: 47,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30)
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(Images.chat,),
                                              const SizedBox(width: 8,),
                                              Text('23',
                                                  style: poppinsSemiBold.copyWith(
                                                      fontSize: 15,
                                                      color: const Color(0xffFFFFFF)
                                                  )
                                              ),
                                              const SizedBox(width: 12,),
                                              SvgPicture.asset(Images.like,),
                                              const SizedBox(width: 8,),
                                              Text('223',
                                                  style: poppinsSemiBold.copyWith(
                                                      fontSize: 15,
                                                      color: const Color(0xffFFFFFF)
                                                  )
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(Images.send,),
                                              const SizedBox(width: 12,),
                                              SvgPicture.asset(Images.subtract,),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                );
              }
          ):const Center(child: CircularProgressIndicator());
        },
      )
    );
  }
}
