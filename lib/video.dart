import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController controller; //initialise
  Future<void> futureController;

  @override
  void initState() {
    controller = VideoPlayerController.network(
        "https://www.youtube.com/watch?v=r5Pcqkhmp_0"); //we will put network url or local file path. Controller is smart enough to access that.
    futureController = controller.initialize();
    controller.setLooping(true); //This won't stop video from playing
    controller.setVolume(25.0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("music for everyone"),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(),
      backgroundColor: Colors.orangeAccent,
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: futureController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(20),
                        height: 300,
                        width: 500,
                        child: VideoPlayer(controller));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }), //we don't know when video will be rendered
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Icon(controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                      setState() {
                        if (controller.value.isPlaying) {
                          controller.pause();
                        } else {
                          controller.play();
                        }
                      }
                    }),
              ],
            ),
            RaisedButton(
                child: Container(
                  height: 50,
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back),
                      Text('Go to Home'),
                    ],
                  ),
                ),
                onPressed: () => Navigator.popAndPushNamed(context, '/'))
          ],
        ),
      ),
    );
  }
}
