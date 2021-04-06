import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;

  VideoPlayer({this.videoUrl});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController _chewieController;

  dynamic appBarHeight() {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * .1;
    } else {
      return MediaQuery.of(context).size.height * .17;
    }
  }

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController

    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
        widget.videoUrl,
      ),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.pause();
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Container(
            height: appBarHeight(),
            child: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              centerTitle: true,
              backgroundColor: Color(0xfff2f2f2).withOpacity(.3),
              elevation: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
