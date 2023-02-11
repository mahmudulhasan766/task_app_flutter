import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/utils/images.dart';
import 'package:task_app/utils/styles.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String mediumId;
  final bool playAble;

  const MyVideoPlayer({
    Key? key,
    required this.mediumId,
    required this.playAble,
  }) : super(key: key);

  @override
  State<MyVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController? _controller;
  bool isPlaying = false;
  bool isLoading = false;
  bool isVolume = true;

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  _initVideoPlayer() async {
    try {
        setState(() {
          isLoading = true;
        });
        _controller = VideoPlayerController.network(widget.mediumId)
          ..initialize().then((value) {
            setState(() {
              isLoading = false;
            });
            _controller!.addListener(() {
              if (!_controller!.value.isPlaying &&
                  _controller!.value.isInitialized &&
                  (_controller!.value.duration ==
                      _controller!.value.position)) {
                setState(() {
                  isPlaying = false;
                });
              }
            });
            setState(() {});
          });
      } catch (ex) {
      log(ex.toString());
    }
  }

  @override
  void dispose() {
    if (_controller != null) {
      if (mounted) {
        _controller!.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
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

              _controller == null || isLoading
                  ? const Center(
                  child: CircularProgressIndicator(
                  ))
                  : _controller!.value.isInitialized
                  ?
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: InkWell(
                  onTap: !widget.playAble
                      ? null
                      : () {
                    if (!isPlaying) {
                      setState(() {
                        isPlaying = true;
                      });
                      _controller!.play();
                    } else {
                      setState(() {
                        isPlaying = false;
                      });
                      _controller!.pause();

                    }
                  },
                  child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!)),
                ),
              ): Container(),
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
                    onTap: () {
                      if (!isVolume) {
                        setState(() {
                          isVolume = true;
                        });
                        _controller!.setVolume(1);
                      } else {
                        setState(() {
                          isVolume = false;
                        });
                        _controller!.setVolume(0);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isVolume ?
                       SvgPicture.asset(Images.soundUnMute):
                      SvgPicture.asset(Images.soundMute),
                    ),
                  ),
                ),
                InkWell(
                  onTap: !widget.playAble
                      ? null
                      : () {
                    if (!isPlaying) {
                      setState(() {
                        isPlaying = true;
                      });
                      _controller!.play();
                    } else {
                      setState(() {
                        isPlaying = false;
                      });
                      _controller!.pause();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: isPlaying ?
                    SvgPicture.asset(Images.pause):
                      SvgPicture.asset(Images.play),
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
    );
  }
}
