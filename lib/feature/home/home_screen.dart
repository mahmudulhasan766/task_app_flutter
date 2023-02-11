import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_app/controller/home_controller.dart';
import 'package:task_app/feature/home/widget/video_player.dart';
import 'package:task_app/utils/images.dart';

import '../../utils/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                                  child: Text( DateFormat('h:mm a')
                                      .format(DateTime.parse(
                                      myController.videoModel.data![index].createdAt.toString())),
                                      style: poppinsRegular.copyWith(
                                          fontSize: 15,
                                          color: const Color(0xff6C7A9C)
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyVideoPlayer(mediumId:  myController.videoModel.data![index].videoUrl.toString(), playAble: true,),
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
