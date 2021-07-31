import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class PrecoBitcoin extends StatefulWidget {
  const PrecoBitcoin({Key? key}) : super(key: key);

  @override
  _PrecoBitcoinState createState() => _PrecoBitcoinState();
}

class _PrecoBitcoinState extends State<PrecoBitcoin> {

  String _preco = "0,00";


  _atualizarPreco() async{

    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    print("Resultado : " + retorno["BRL"]["buy"].toString());

    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30
                ),
                ),
              Text("Valor: " + _preco),
              ElevatedButton(
                onPressed: () => _atualizarPreco(),
                child: Text("Atualizar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}