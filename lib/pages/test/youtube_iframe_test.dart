import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeTest extends StatefulWidget {
  const YoutubeTest({super.key, required this.videoId});
  final String videoId;

  @override
  State<YoutubeTest> createState() => _YoutubeTestState();
}

class _YoutubeTestState extends State<YoutubeTest> {
  // String? videoId;
  // final url =
  //     'https://www.youtube.com/watch?v=your_video_id'; // Replace with your actual URL

  // convertUrltoId(url) {
  //   videoId = YoutubePlayerController.convertUrlToId(url);
  //   return videoId;
  // }
  late YoutubePlayerController _controller;

  // final _controller = YoutubePlayerController.fromVideoId(
  //   videoId: widget.videoId,
  //   params: const YoutubePlayerParams(
  //     mute: false,
  //     showControls: true,
  //     showFullscreenButton: true,
  //   ),
  // );

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
