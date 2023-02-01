// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VPYoutube extends StatefulWidget {
  final double? height;
  final double? width;
  final String? videoUrl;
  const VPYoutube({Key? key, this.videoUrl, this.width, this.height})
      : super(key: key);

  @override
  State<VPYoutube> createState() => _VPYoutubeState();
}

class _VPYoutubeState extends State<VPYoutube> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl!);
    print(videoId!);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}
