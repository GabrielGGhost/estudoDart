import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audio = AudioPlayer();
  AudioCache cache = AudioCache(prefix: "audios/");
  bool primeiraExecucao = true;
  double volume = 0.5;

  _play() async {
    //String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    //int resultado = await audio.play(url);

    if(primeiraExecucao){
      audio = await cache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      audio.resume();
    }

  }

  _pausar() async {
    int resultado = await audio.pause();
  }

  _parar() async {
    int resultado = await audio.stop();

  }

  @override
  Widget build(BuildContext context) {

    _play();

    return Scaffold(
      appBar: AppBar(
        title: Text("Player de música"),
      ),
      body: Column(
        children: [
          Slider(
              value: volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novoVolume){
                setState(() {
                  volume = novoVolume;
                  audio.setVolume(volume);
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/executar.png"),
                  onTap: (){
                    _play();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/images/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
