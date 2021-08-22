import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'Utilitarios.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaAnimes = [];
  TextEditingController _controller = new TextEditingController();
  Map<String, dynamic> _ultimoRemovido = Map();

  get color => null;

  _salvarAnime(){
    sep();
    print("Salvando anime...");
    sep();
    Map<String, dynamic> animes = Map();
    animes["titulo"] = _controller.text;
    animes["assistido"] = false;

    setState(() {
      _listaAnimes.add(animes);
    });
    _salvarArquivo();
    sep();
    print("Anime Salvo");
    sep();
  }

  _salvarArquivo() async {
    sep();
    print("Salvando arquivo...");
    sep();
    var arquivo = await _getArquivo();

    String dados = json.encode(_listaAnimes);
    arquivo.writeAsStringSync(dados);
    sep();
    print("Arquivo Salvo");
    sep();
    _controller.text = "";
  }

  Future<File> _getArquivo() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/dados.json");
  }

  _lerArquivo() async {

    try {
      final arq = await _getArquivo();
      return arq.readAsString();

    } catch (e){
      return null;
    }
  }

  @override
  void initState() {

    _lerArquivo().then((dados){
      setState(() {
        _listaAnimes = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context, index){

    final item = _listaAnimes[index]["titulo"];

    return new Dismissible(
        key: Key( DateTime.now().millisecondsSinceEpoch.toString()),
        direction:  DismissDirection.endToStart,
        onDismissed: (direct){

          _ultimoRemovido = _listaAnimes[index];

          _listaAnimes.removeAt(index);
          _salvarArquivo();

          final snackBar = new SnackBar(
              content: new Text("Anime Removido!"),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                label: "Desfazer",
                onPressed: (){
                  setState(() {
                    _listaAnimes.insert(index, _ultimoRemovido);
                  });
                  _salvarArquivo();
                },
              ),
              backgroundColor: Colors.green,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon (
                  Icons.delete,
                  color: Colors.white),
            ],
          ),
        ),
        child: new  CheckboxListTile(
            title: new Text(_listaAnimes[index]["titulo"]),
            value: _listaAnimes[index]["assistido"],
            onChanged: (valor){
              setState(() {
                _listaAnimes[index]["assistido"] = valor;
              });
              _salvarArquivo();
            }
        )
    );
  }

  void sep(){
    return Utilitarios.sep();
  }

  @override
  Widget build(BuildContext context) {
    print("Itens: " + _listaAnimes.toString());
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Minha Lista de Animes"),
      ),
      body: new Column(
        children: [
          new Expanded(
              child: new ListView.builder(
                  itemBuilder: criarItemLista,
                  itemCount: _listaAnimes.length,
              )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showDialog(
              context: context,
              builder: (context) {
                return new AlertDialog(
                  title: Text("Adicionar Anime"),
                  content: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Digite um anime"
                    ),
                    onChanged: (text){
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: new Text("Cancelar")
                    ),
                    TextButton(
                    onPressed: (){
                      _salvarAnime();
                      Navigator.pop(context);
                    },
                     child: new Text("Salvar")
                     )
                  ],
                );
              }
              );
            },
        icon: new Icon(Icons.add),
        label: new Text("Adicionar Anime"),
        elevation: 6,
      ),

      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          children: <Widget>[
            new IconButton(
                onPressed: (){},
                icon: new Icon(Icons.view_module)),
          ],
        )
        ,
      ),
    );
  }
}
