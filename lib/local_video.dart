import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_Local extends StatefulWidget {
  @override
  _Video_LocalState createState() => _Video_LocalState();
}

class _Video_LocalState extends State<Video_Local> {
  VideoPlayerController _videoController;
  int _playbackTime = 0;

  void _initPlayer() async {
    //_videoController = VideoPlayerController.(
    // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    _videoController = VideoPlayerController.asset('assets/Ted.Ed.mp4'); //
    await _videoController.initialize();
    setState(() {});
  }

  @override
  void initState() {
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
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[900],
        child: Column(
          children: <Widget>[
            _videoController.value.initialized ? _playerWidget() : Container(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.purple[900],
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _videoController.value.isPlaying
                            ? Icon(Icons.pause, color: Colors.white)
                            : Icon(Icons.play_arrow, color: Colors.white),
                        Text('Play/Pause'),
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
                RaisedButton(
                    color: Colors.purple[900],
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.arrow_back, color: Colors.white),
                          Text(
                            'Go to Home',
                            style: TextStyle(color: Colors.purple[900]),
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
            activeColor: Colors.purple[900],
            inactiveColor: Colors.purple[50],
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
