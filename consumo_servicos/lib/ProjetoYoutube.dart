import 'package:consumo_servicos/TelasYoutune/Biblioteca.dart';
import 'package:consumo_servicos/TelasYoutune/EmAlta.dart';
import 'package:consumo_servicos/TelasYoutune/Inicio.dart';
import 'package:consumo_servicos/TelasYoutune/Inscricao.dart';
import 'package:flutter/material.dart';


class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {

  int _indAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      new Inicio(),
      new EmAlta(),
      new Inscricao(),
      new Biblioteca(),
    ];

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
      body: telas[_indAtual],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _indAtual,
        onTap: (indice){
          setState(() {
            _indAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Início",
              backgroundColor: Colors.orange
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.whatshot),
            label: "Em alta",
            backgroundColor: Colors.blue
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.whatshot),
              label: "Em alta",
              backgroundColor: Colors.purple
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.whatshot),
              label: "Em alta",
              backgroundColor: Colors.green
          ),
        ],
      ),
    );
  }
}
