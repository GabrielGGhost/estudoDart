import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  _buscarCep() async {
    String cep = "18076310";
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;

    response = await http.get(url);

    // print("Resposta: " + response.statusCode.toString());
    // print("Resposta: " + response.body);

    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String uf = retorno["uf"];
    String cidade = retorno["localidade"];

    print("Você mora em ${uf} - ${cidade}, ${logradouro}, ${bairro}");
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
            ElevatedButton(
                onPressed: () => _buscarCep(),
                child: Text("Clique aqui"))
          ],
        ),
      ),
    );
  }
}
