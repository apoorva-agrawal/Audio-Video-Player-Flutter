import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  VideoPlayerController _videoController;
  int _playbackTime = 0;

  void _initPlayer() async {
    _videoController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    //_videoController = VideoPlayerController.asset('assets/Ted.Ed.mp4');//
    await _videoController.initialize();
    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _initPlayer();
    _videoController.addListener(
        () {}); //this listener stores values everytime our videoController changes
    setState(() {
      _playbackTime = _videoController
          .value.position.inSeconds; //this stores the current state in listener
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("music for everyone. ."),
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            _videoController.value.initialized ? _playerWidget() : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.tealAccent[400],
                  child: Container(
                    height: 50,
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _videoController.value.isPlaying
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow),
                        Text('Play/Pause', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  onPressed: () {
                    _videoController.value.isPlaying
                        ? _videoController.pause()
                        : _videoController.play();
                    setState(() {});
                  },
                ),
                Container(
                  height: 10,
                ),
                RaisedButton(
                    color: Colors.tealAccent[400],
                    child: Container(
                      height: 50,
                      width: 130,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_back),
                          Text(
                            'Go to Home',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => Navigator.popAndPushNamed(context, '/')),
              ],
            ),
            //this will check if player is initiliazed or not, if not it will show empty container
          ],
        ),
      ),
    );
  }

  Widget _playerWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: _videoController.value.aspectRatio,
          child: VideoPlayer(_videoController),
        ),
        Slider(
            value: _playbackTime.toDouble(),
            max: _videoController.value.duration.inSeconds.toDouble(),
            min: 0,
            onChanged: (v) {
              _videoController.seekTo(Duration(seconds: v.toInt()));
            }),
      ],
    );
  }
}
