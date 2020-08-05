//import 'dart:js';

//import 'dart:html';

//import 'dart:js';

//import 'dart:js';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_Player_2_8/Video_Player.dart';
import 'package:video_Player_2_8/local_play.dart';
import 'package:video_player/video_player.dart';
import 'video.dart';
import 'Video_Player.dart';
import 'Audio_Player.dart';
import 'local_video.dart';

void main() {
  runApp(MaterialApp(
    title: 'xyz',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstPage(),
      '/second': (context) => Local_Play(),
      '/third': (context) => LocalAudio(),
      //'/fourth': (context) => VideoPlayerPage(),
      '/fourth': (context) => VideoPlay(),
      '/fifth': (context) => FormScreen(),
      '/sixth': (context) => VideoPlayerPage(),
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
        title: Text("music for everyone. ."),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Container(
          color: Colors.black87,
          child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(20),
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
                // to contain both buttons overall
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //to adjust spacing between two buttons
                    width: 200,
                    height: 150,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.tealAccent[700],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // to distinguish b/w icon and text within raised button
                          children: <Widget>[
                            Icon(Icons.play_arrow),
                            Text(
                              "Browse Online",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        }),
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.tealAccent[700],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.play_arrow),
                            Text(
                              "Play Locally",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        }),
                  )
                ],
              ))),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

// Create a Form widget.

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _videourl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildURL() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'enter url of the video',
          labelStyle: TextStyle(fontSize: 20)),
      validator: (String value) {
        if (value.isEmpty) {
          return 'url is required';
        }
        return null;
      },
      onSaved: (String value) {
        _videourl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[300],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildURL(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    } else {
                      _formKey.currentState.save();
                      print(_videourl);
                    }
                  },
                ),
                RaisedButton(
                    padding: EdgeInsets.all(5),
                    color: Colors.tealAccent[700],
                    child: Row(children: <Widget>[
                      Icon(Icons.arrow_back),
                      Text('Go to Home'),
                    ]),
                    onPressed: () => Navigator.popAndPushNamed(context, '/'))
              ],
            )),
      ),
    );
  }
}
