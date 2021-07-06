import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jogar extends StatefulWidget {
  @override
  _jogarState createState() => _jogarState();
}

String fazerJogada(){

  int num = 0;
  do{
    num = 0;
    num = Random().nextInt(4);

  } while(num == 0);

  return num.toString();
}

class _jogarState extends State<jogar> {

  static const pedra = "pedra",
                papel = "papel",
                tesoura = "tesoura",
                padrao = "padrao";

  String escolhaUsuario = "0";
  String escolhaMaquina = "0";
  int vitoriasUsuario = 0;
  int vitoriasMaquina = 0;
  int empates = 0;
  int jogadas = 0;
  String mensagem = "Escolha sua jogada";

  @override
  Widget build(BuildContext context) {

    int ponto = -1;
    if(escolhaMaquina != "0" && escolhaUsuario != "0"){
      ponto = calcularPonto(escolhaMaquina, escolhaUsuario);
    }

    switch (escolhaUsuario){
      case "1":
        escolhaUsuario = pedra;
        break;
      case "2":
        escolhaUsuario = papel;
        break;
      case "3":
        escolhaUsuario = tesoura;
        break;
      default:
        escolhaUsuario = padrao;
    }
    switch (escolhaMaquina){
      case "1":
        escolhaMaquina = pedra;
        break;
      case "2":
        escolhaMaquina = papel;
        break;
      case "3":
        escolhaMaquina = tesoura;
        break;
      default:
        escolhaMaquina = padrao;
    }

    if(ponto == 0){
      empates++;
      mensagem = "Empate!";
      jogadas++;
    } else if(ponto == 1){
      vitoriasUsuario++;
      mensagem = "Você ganhou!";
      jogadas++;
    } else if (ponto == 2){
      vitoriasMaquina++;
      mensagem = "Você perdeu!";
      jogadas++;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("JoKenPô"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                padding: EdgeInsets.only(top:16, bottom:16),
                child: Text(
                  "Sua escolha   |   Escolha do App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "images/$escolhaUsuario.png",
                    width: 100,
                  ),
                  Image.asset(
                    "images/$escolhaMaquina.png",
                    width: 100,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 32, bottom: 16)
                  ),
                  Text(
                    mensagem,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "images/pedra.png",
                      height: 60,
                    ),
                    onTap: (){
                      setState(() {
                        escolhaUsuario = "1";
                        escolhaMaquina = fazerJogada();
                      });
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "images/papel.png",
                      height: 60,
                    ),
                    onTap: (){
                      setState(() {
                        escolhaUsuario = "2";
                        escolhaMaquina = fazerJogada();
                      });
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "images/tesoura.png",
                      height: 60,),
                    onTap: (){
                      setState(() {
                        escolhaUsuario = "3";
                        escolhaMaquina = fazerJogada();
                      });
                    },
                  ),
                ],
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 25)

                ),
                Row(
                  children: [
                    Text(
                      "Vitórias: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial"
                      ),
                    ),
                    Text(
                    "$vitoriasUsuario",
                    style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Arial"
                    ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Derrotas: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial"
                      ),
                    ),
                    Text(
                      "$vitoriasMaquina",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Arial"
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Empates: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial"
                      ),
                    ),
                    Text(
                      "$empates",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Arial"
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Jogadas: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Arial"
                      ),
                    ),
                    Text(
                      "$jogadas",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Arial"
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        vitoriasMaquina = 0;
                        vitoriasUsuario = 0;
                        jogadas = 0;
                        empates = 0;
                        escolhaMaquina = "0";
                        escolhaUsuario = "0";
                        mensagem = "Escolha sua jogada";
                      });
                    },
                    child: Text("Resetar")
                )
              ],
            )
           ],
      )
    );
  }

  int calcularPonto(String escolhaMaquina, String escolhaUsuario) {

    int ponto = 0;
    //0 - Empate
    //1 - Jogador
    //2 - Máquina

    switch(escolhaUsuario){
      case "1"://Pedra
        {
          switch (escolhaMaquina) {
            case "1": //Pedra
              ponto = 0;
              break;
            case "2": //Papel
              ponto = 2;
              break;
            case "3": //Tesoura
              ponto = 1;
              break;
          }
          break;
        }
      case "2": //Papel
        {
          switch (escolhaMaquina) {
            case "1": //Pedra
              ponto = 1;
              break;
            case "2": //Papel
              ponto = 0;
              break;
            case "3"://Tesoura
              ponto = 2;
              break;
          }
        }
        break;
      case "3"://Tesoura
        {
          switch (escolhaMaquina) {
            case "1": //Pedra
              ponto = 2;
              break;
            case "2": //Papel
              ponto = 1;
              break;
            case "3":
              ponto = 0;
              break;
          }
        }
        break;
    }

    return ponto;
  }
}
