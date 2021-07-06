import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(new MaterialApp(
      title: "Frases do dia",
      home: atualizaFrase()
  ));

}

class atualizaFrase extends StatefulWidget {
  @override
  _atualizaFraseState createState() => _atualizaFraseState();
}

class _atualizaFraseState extends State<atualizaFrase> {

  int num = Random().nextInt(7);

  List animes = [
    "Dragon Ball",
    "Pokemon",
    "One Piece",
    "One Punch Man",
    "Record of Ragnarok",
    "Demon Slayer",
    "Boku no Hero",
  ];

  List descricoes = [
    "Goku busca ser o mais forte no universo, enfrentando guerreiros cada vez mais forte para alcançar seu objetivo",
    "Ash é um garoto que deseja ser o maior mestre pokemon do mundo, para isso ele enfrenta todos os líderes de ginásios de várias regiões diferentes.",
    "Luffy tem o sonho de ser o rei dos piratas, para isso terá de navegar através do mar mais perigoso do mundo, a Grand Line, onde habitam os Imperadores do mar, para se tornar o rei dos piratas, terá de enfrentá-los para ahar o One Piece",
    "Saitama é um homem que alcançou a força absoluta, ao contrário do que muitos pensam, isso o causa um absuluto, seu hobbie é ser super herói nas horas vagas",
    "A humanidade está em risco, os deuses planejam acabar com toda a raça humana, mas uma bondosa valquiria sugere a ideia de fazer o Ragnarok para uma tentativa de salvar a humanidade, onde 12 humanos mais habilidosos lutaram conta 12 deuses.",
    "Num mundo onde demônios atacam as pessoas, o portagonista tem sua familia morta pelo rei desses demônios e sua irmã tranformada em um. Após isso ele leva sua irmã que luta contra seus instintos para o encontro com este rei para transformá-la de volta.",
    "Midorya é um garoto que nasceu sem uma indivudualidade, um poder que 80% da população possui, seus desejos e indole o fazem receber o poder do herói numero um, então terá que treinar arduamente para dominar esse poder avassalador que pode o matar."
  ];

  @override
  Widget build(BuildContext context) {

    var anime = animes[num];
    var descricao = descricoes[num];
    print(num);
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia!"),
        backgroundColor: Colors.green,
      ),
      body:Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                anime,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                descricao,
                style: TextStyle(
                    fontSize: 15,
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      num = Random().nextInt(7);
                      anime = animes[num];
                      descricao = descricoes[num];
                      print(num);
                    });
                  },
                  child: Text("Gerar Frase")
              )
            ],
          ),
        ),
      ),

    );
  }
}
