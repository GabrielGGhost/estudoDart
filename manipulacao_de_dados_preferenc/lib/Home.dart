import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();

  String _textoSalvo = "Nada salvo";

  _salvar() async {
    String digitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", digitado);

    print("Operação Salvar '$digitado' foi salvo");
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    print("Operação Recuperar '$_textoSalvo' foi recuperado");
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });

  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("nome");
    print("Operação Remover '$_textoSalvo' foi removido");
    setState(() {
      _textoSalvo = "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Digite algo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _salvar,
                ),
                ElevatedButton(
                  child: Text(
                      "Recuperar",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _recuperar,
                ),
                ElevatedButton(
                  child: Text(
                      "Remover",
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  onPressed: _remover,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
