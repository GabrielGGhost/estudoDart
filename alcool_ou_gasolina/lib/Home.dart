import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor:  Colors.purple,
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child:  Image.asset("imagens/logo.png"),
            ),
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                ),
              ),

        ),
          TextField(
            keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço Alcool, ex: 1.50"
              ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerAlcool,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Preço Gasolina, ex: 1.50"
            ),
            style: TextStyle(
                fontSize: 22
            ),
            controller: _controllerGasolina,
          ),
          Padding(
           padding: EdgeInsets.only(top: 10),
           child: ElevatedButton(
             onPressed: (){},
             child: Text("Calcular"),
             style: Padding,
           ),
          ),
          ]
        ),
      ),
    );
  }
}
