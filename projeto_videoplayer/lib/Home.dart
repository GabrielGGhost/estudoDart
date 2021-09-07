import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //VideoPlayerController? _controller;

  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _controller = VideoPlayerController.network(
        "https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_30mb.mp4"
    )..initialize().then((_){
      setState(() {
        _controller!.play();
      });
    });
  }*/


  VideoPlayerController? _controller = VideoPlayerController.asset(
        "videos/exemplo.mp4"
    )..setLooping(true)..initialize().then((_) {
      //_controller!.play();
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller!.value.initialized
            ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller))
                :  Text("Pressione o play"),
        ),
      floatingActionButton: FloatingActionButton(
      child: Icon(
          _controller!.value.isPlaying
          ? Icons.pause
          : Icons.play_arrow
      ),
        onPressed: (){
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
      ),
    );
  }
}


