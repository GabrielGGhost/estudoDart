import 'package:consumo_servicos/AlertList.dart';
import 'package:consumo_servicos/BuscaCep.dart';
import 'package:consumo_servicos/DadosWeb.dart';
import 'package:consumo_servicos/FutereBitcoin.dart';
import 'package:consumo_servicos/precoBitcoin.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BuscaCep())
                  );
                },
                child: Text("Busca cep")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrecoBitcoin())
                  );
                },
                child: Text("Preço Bitcoin")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AlertList())
                  );
                },
                child: Text("Alert List")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FutureBitcoin())
                  );
                },
                child: Text("Bitcoin com future")),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DadosWeb())
                  );
                },
                child: Text("Dados Web")),
          ],
        ),
      ),
    );
  }
}
