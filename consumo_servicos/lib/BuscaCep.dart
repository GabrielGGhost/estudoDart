import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BuscaCep extends StatefulWidget {
  const BuscaCep({Key? key}) : super(key: key);

  @override
  _BuscaCepState createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCep> {

  TextEditingController _controllerCep = TextEditingController();
  String _logradouro = "",
         _bairro = "",
         _uf = "",
         _cidade = "";

  _buscarCep() async {
    String cep = _controllerCep.text;
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(url);

    // print("Resposta: " + response.statusCode.toString());
    // print("Resposta: " + response.body);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _logradouro = retorno["logradouro"];
      _bairro = retorno["bairro"];
      _uf = retorno["uf"];
      _cidade = retorno["localidade"];

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
            Text("Logradouro: ${_logradouro}\r\n" +
                "Bairro: ${_bairro}\r\n" +
                "Cidade: ${_cidade}\r\n" +
                "UF: ${_uf}\r\n"
            ),
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
