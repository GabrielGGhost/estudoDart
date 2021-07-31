import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _logradouro = "";

  _buscarCep() async {
    String cep = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(url);

    // print("Resposta: " + response.statusCode.toString());
    // print("Resposta: " + response.body);

    Map<String, dynamic> retorno = json.decode(response.body);

    String bairro = retorno["bairro"];
    String uf = retorno["uf"];
    String cidade = retorno["localidade"];

    setState(() {
      _logradouro = retorno["logradouro"];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviços web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text("Rua: ${_logradouro}"),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o cep: ex: 18076310"
              ),
              controller: _controllerCep,
            ),
            ElevatedButton(
                onPressed: () => _buscarCep(),
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
