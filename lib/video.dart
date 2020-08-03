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
    //controller = VideoPlayerController.network(
    //"https://www.youtube.com/watch?v=r5Pcqkhmp_0"); //we will put network url or local file path. Controller is smart enough to access that.
    controller = VideoPlayerController.asset('assets/Ted_Ed.mp4');

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
        backgroundColor: Colors.tealAccent[700],
      ),
      drawer: Drawer(),
      backgroundColor: Colors.grey[200],
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            gradient: LinearGradient(
                colors: [Colors.blue[50], Colors.tealAccent[700]]),
            border: Border.all(
              width: 0.1,
              color: Colors.grey[200],
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: <Widget>[
            FutureBuilder(
                future: futureController,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(20),
                        height: 200,
                        width: 500,
                        child: VideoPlayer(controller));
                  else
                    return Center(child: CircularProgressIndicator());
                }), //we don't know when video will be rendered
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (!controller.value.isPlaying)
                  RaisedButton(
                      child: Icon(Icons.play_arrow),
                      onPressed: () {
                        print('check');
                        setState(() {
                          controller.play();
                        });
                      })
                else
                  RaisedButton(
                      child: Icon(Icons.pause),
                      onPressed: () {
                        setState(() {
                          controller.pause();
                        });
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
