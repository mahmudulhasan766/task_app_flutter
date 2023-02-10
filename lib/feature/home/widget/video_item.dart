import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  VideoItem(
      {required this.videoPlayerController,
        required this.looping,
        required this.autoplay,
        Key? key})
      : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  //VideoPlayerController? videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    //initializeVideoPlayerFuture = widget.videoPlayerController.initialize();
    widget.videoPlayerController.setLooping(false);
    widget.videoPlayerController.setVolume(1.0);
    //widget.videoPlayerController.play();
    widget.videoPlayerController.pause();
    super.initState();
    //videoPlayerController = widget.videoPlayerController.initialize();
    // _chewieController = ChewieController(
    //     videoPlayerController: widget.videoPlayerController,
    //     aspectRatio: 32 / 8,
    //     autoInitialize: true,
    //     autoPlay: widget.autoplay,
    //     looping: widget.looping,
    //     errorBuilder: (context, errorMesaage) {
    //       return Center(
    //         child: Text(
    //           errorMesaage,
    //           style: TextStyle(color: Colors.red),
    //         ),
    //       );
    //     });
  }
  // Future<VideoPlayerController?> initializePlayer(String videoUrl) async {
  //   videoPlayerController = VideoPlayerController.network(videoUrl);
  //   await videoPlayerController!.initialize();
  //   videoPlayerController!.setLooping(true);
  //   videoPlayerController!.setVolume(1.0);
  //   videoPlayerController!.play();
  //
  //   return videoPlayerController;
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   // _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.videoPlayerController.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: widget.videoPlayerController.value.aspectRatio,
            child: VideoPlayer(widget.videoPlayerController),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
