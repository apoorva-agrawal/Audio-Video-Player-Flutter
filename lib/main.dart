//import 'dart:js';

//import 'dart:html';

//import 'dart:js';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_Player_2_8/local_play.dart';
import 'package:video_player/video_player.dart';
import 'video.dart';

void main() {
  runApp(MaterialApp(
    title: 'xyz',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),
      '/second': (context) => Local_Play(),
      '/third': (context) => LocalAudio(),
      '/fourth': (context) => VideoPlayerPage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

class FirstPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("music for everyone"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          margin: EdgeInsets.all(20),
          child: Column(
            // to contain both buttons overall
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //to adjust spacing between two buttons
                width: 200,
                height: 130,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: RaisedButton(
                    color: Colors.orangeAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // to distinguish b/w icon and text within raised button
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text(
                          "Browse Online",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fourth');
                    }),
              ),
              Container(
                width: 200,
                height: 130,
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    color: Colors.orangeAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text(
                          "Play Locally",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    }),
              )
            ],
          )),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

/*
// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter url';
              }
              return value;
            },
          ),
          
             RaisedButton(
               Text('Submit'),
               padding: EdgeInsets.all(5),
              color: Colors.orangeAccent,
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
            ),
          
          RaisedButton(
            Icon(Icons.arrow_back),
            Text('Go to Home'),
            padding: EdgeInsets.all(5),
            color: Colors.orangeAccent,
            onPressed: () => Navigator.popAndPushNamed(context, '/'))
        ],
      ),
    );
  }
}
*/

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
      inactiveColor: Colors.orangeAccent,
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
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.orangeAccent,
          title: Text('Local Player'),
        ),
        body: Container(
          width: 200,
          height: 130,
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
    );
  }
}
