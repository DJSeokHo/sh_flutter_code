import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const YoutubePlayerExample());
}

class YoutubePlayerExample extends StatelessWidget {
  const YoutubePlayerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ScrollTag Example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              _ContentView()
            ],
          ),
        ),
      ),
    );
  }

}

class _ContentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentViewState();
  }
}

class _ContentViewState extends State<_ContentView> {

  // final _controller = YoutubePlayerController(
  //   params: const YoutubePlayerParams(
  //     mute: false,
  //     showControls: true,
  //     showFullscreenButton: true,
  //   ),
  // );


// If the requirement is just to play a single video.
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'R0MhrgBQQcM',
    autoPlay: false,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
    ),
  );

  @override
  void initState() {

    super.initState();

    _setOrientation([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // _controller.loadVideoById(videoId: "R0MhrgBQQcM"); // Auto Play
    // _controller.cueVideoById(...); // Manual Play
    // _controller.loadPlaylist(...); // Auto Play with playlist
    // _controller.cuePlaylist(...); // Manual Play with playlist
  }

  @override
  void dispose() {
    super.dispose();

    _setOrientation([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _controller.close();
  }

  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}