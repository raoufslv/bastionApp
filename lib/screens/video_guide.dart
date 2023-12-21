import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoGridActivity extends StatelessWidget {
  final List<String> videoTitles;
  final List<String> videoUrls;
  final List<String> placeholderImageUrls;

  const VideoGridActivity({
    Key? key,
    required this.videoTitles,
    required this.videoUrls,
    required this.placeholderImageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView.builder(
          itemCount: videoUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YouTubePlayerPage(
                      videoUrl: videoUrls[index],
                    ),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          placeholderImageUrls[index],
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        videoTitles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class YouTubePlayerPage extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _YouTubePlayerPageState createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  late YoutubePlayerController _controller;
  late bool _isFullScreen;
  bool _isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        forceHD: true,
      ),
    );
    _isFullScreen = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_controller.value.isReady) {
          _controller.dispose();
        }
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        appBar: _isFullScreen
            ? null
            : AppBar(
                title: const Text('YouTube Video Player'),
                centerTitle: true,
                backgroundColor: Colors.black,
              ),
        body: Container(
          color: Colors.black,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Visibility(
              visible: _isFullScreen || _isAppBarVisible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isAppBarVisible = !_isAppBarVisible;
                  });
                },
                child: Center(
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      _controller.addListener(() {
                        if (_controller.value.isFullScreen != _isFullScreen) {
                          setState(() {
                            _isFullScreen = _controller.value.isFullScreen;
                          });
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_controller.value.isReady) {
      _controller.dispose();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
