import 'package:flutter/material.dart';


class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
          title: Image.asset(
              "images/youtube.png",
              width: 98,
              height: 22,),
          backgroundColor: Colors.white,
          actions: [
            new IconButton(
                onPressed: ()=>{},
                icon: new Icon(
                  Icons.videocam
                )
            ),
            new  IconButton(
                onPressed: ()=>{},
                icon: new Icon(
                    Icons.search
                )
            ),
            new IconButton(
                onPressed: ()=>{},
                icon: new Icon(
                    Icons.account_circle
                )
            ),
          ],
      ),
      body: new Container(

      ),
    );
  }
}
