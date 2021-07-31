import 'package:consumo_servicos/BuscaCep.dart';
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
                child: Text("Preço Bitcoin"))
          ],
        ),
      ),
    );
  }
}
