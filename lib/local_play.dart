import 'package:flutter/material.dart';

class Local_Play extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("music for everyone. ."),
        backgroundColor: Colors.purple[900],
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
                  //colors: [Colors.blue[50], Colors.purple[900]]),
                  border: Border.all(
                    width: 2,
                    color: Colors.purple[900],
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
                    height: 130,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.purple[900],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // to distinguish b/w icon and text within raised button
                          children: <Widget>[
                            Icon(Icons.play_arrow, color: Colors.white),
                            Text(
                              "Audio",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/third');
                        }),
                  ),
                  Container(
                    width: 200,
                    height: 130,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: RaisedButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.purple[900],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.play_arrow, color: Colors.white),
                            Text(
                              "Video",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fourth');
                        }),
                  )
                ],
              ))),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
