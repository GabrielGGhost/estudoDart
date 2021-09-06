import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ingles/Constants/Pathes.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {

  AudioPlayer audio = AudioPlayer();
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

    audio = await cache.play(path);
  }


  @override
  Widget build(BuildContext context) {

    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
        children: [
          GestureDetector(
            onTap: (){
              _playAudio("cao");
            },
            child: Image.asset( _getPhotoPath("cao")),
          ),
          GestureDetector(
            onTap: (){
              _playAudio("gato");
            },
            child: Image.asset( _getPhotoPath("gato")),
          ),
          GestureDetector(
            onTap: (){
              _playAudio("leao");
            },
            child: Image.asset( _getPhotoPath("leao")),
          ),GestureDetector(
            onTap: (){
              _playAudio("macaco");
            },
            child: Image.asset( _getPhotoPath("macaco")),
         ),GestureDetector(
            onTap: (){
              _playAudio("ovelha");
            },
            child: Image.asset( _getPhotoPath("ovelha")),
          ),GestureDetector(
            onTap: (){
              _playAudio("vaca");
            },
            child: Image.asset( _getPhotoPath("vaca")),
          ),
        ],
    );
  }
}
