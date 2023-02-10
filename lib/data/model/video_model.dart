import 'package:video_player/video_player.dart';

class VideoModel {
  bool? success;
  List<Data>? data;

  VideoModel({this.success, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? caption;
  String? videoUrl;
  String? createdAt;
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  Data({this.id, this.caption, this.videoUrl, this.createdAt,required this.controller});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    createdAt = json['created_at'];
    controller = VideoPlayerController.network("https://hajjmanagment.online/get/video/others/1675227540483-213848212.mp4");
    initializeVideoPlayerFuture = controller.initialize();
    controller.setVolume(1.0);
    controller.setLooping(true);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['video_url'] = videoUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
