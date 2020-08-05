import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LocalAudio extends StatefulWidget {
  @override
  _LocalAudioState createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer advancePlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancePlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancePlayer);

    advancePlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    advancePlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  String localFilePath;
  Widget _tab(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
              children: children
                  .map((w) => Container(
                        child: w,
                        padding: EdgeInsets.all(6.0),
                      ))
                  .toList()),
        )
      ],
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.tealAccent[700],
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancePlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.tealAccent[700],
          title: Text('Local Player'),
        ),
        body: Container(
          color: Colors.black87,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                //gradient: LinearGradient(
                //colors: [Colors.blue[50], Colors.tealAccent[700]]),
                border: Border.all(
                  width: 2,
                  color: Colors.tealAccent[400],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  height: 300,
                  width: 300,
                  child: Image(
                      image: AssetImage(
                          "assets/edith_piaf-la_vie_en_rose_front.jpg"),
                      fit: BoxFit.cover),
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Icon(Icons.play_arrow),
                        onPressed: () => audioCache.play('La_Vie_En_Rose.mp3')),
                    RaisedButton(
                        child: Icon(Icons.pause),
                        onPressed: () => advancePlayer.pause()),
                    RaisedButton(
                        child: Icon(Icons.stop),
                        onPressed: () => advancePlayer.stop()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
