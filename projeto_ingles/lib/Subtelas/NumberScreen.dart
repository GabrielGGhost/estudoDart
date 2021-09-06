import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ingles/Constants/Pathes.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {

  AudioCache cache = AudioCache();

  String _getPhotoPath(String name, [String? ext]){
    if(ext == null){
      return Pathes.IMAGE_PATH + name + ".png";
    }
    return Pathes.IMAGE_PATH + name + ext;
  }

  _playAudio(String name, [String? ext]) async {

    String path = "";
    if(ext == null){
      path = Pathes.AUDIO_PATH + name + ".mp3";
    } else {
      path = Pathes.AUDIO_PATH + name + "." + ext;
    }


    await cache.play(path);
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: [
        GestureDetector(
          onTap: (){
            _playAudio("1");
          },
          child: Image.asset( _getPhotoPath("1")),
        ),
        GestureDetector(
          onTap: (){
            _playAudio("2");
          },
          child: Image.asset( _getPhotoPath("2")),
        ),
        GestureDetector(
          onTap: (){
            _playAudio("3");
          },
          child: Image.asset( _getPhotoPath("3")),
        ),GestureDetector(
          onTap: (){
            _playAudio("4");
          },
          child: Image.asset( _getPhotoPath("4")),
        ),GestureDetector(
          onTap: (){
            _playAudio("5");
          },
          child: Image.asset( _getPhotoPath("5")),
        ),GestureDetector(
          onTap: (){
            _playAudio("6");
          },
          child: Image.asset( _getPhotoPath("6")),
        ),
      ],
    );
  }
}
