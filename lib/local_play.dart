import 'package:flutter/material.dart';

class Local_Play extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("music for everyone. ."),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.tealAccent[700],
              gradient: LinearGradient(
                  colors: [Colors.blue[50], Colors.tealAccent[700]]),
              border: Border.all(
                width: 0.1,
                color: Colors.grey[200],
              ),
              borderRadius: BorderRadius.circular(30)),
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
                    color: Colors.tealAccent[700],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // to distinguish b/w icon and text within raised button
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text(
                          "Audio",
                          style: TextStyle(fontSize: 20),
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
                    color: Colors.tealAccent[700],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.play_arrow),
                        Text(
                          "Video",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fourth');
                    }),
              )
            ],
          )),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
