import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Post.dart';

class DadosWeb extends StatefulWidget {
  @override
  _DadosWebState createState() => _DadosWebState();
}

class _DadosWebState extends State<DadosWeb> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>>? _recuperarPostagens() async{

    http.Response response = await http.get( _urlBase + "/posts");
    var dadosJson = json.decode(response.body);
    List<Post> listagem = [];

    int tam = 0;
    for(var post in dadosJson){
      Post p = new Post(post["userId"], post["id"], post["title"], post["body"]);
      listagem.add(p);
    }

    return listagem;
  }

  String _getValue(String? valor){
    return valor.toString();
  }

  String _getValueInt(int? valor){
    return _getValue(valor.toString());
  }

  _post() async{

    var corpo = json.encode(
      {
        "userId": 24,
        "id": null,
        "title": "One Piece",
        "body": "Anime do piratinha que estica."
      }
    );

    http.Response response = await http.post(
        _urlBase + "/posts",
    headers: {
      "Content-type": "application/json; charset=UTF-8"
    },
    body: corpo
    );

    print("Resposta: " + response.statusCode.toString());
    print("Resposta: " + response.body);

  }

  _put(){

  }

  _delete(){

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Dados Web"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16),
        child: new Column(
          children: [
            new Row(
              children: [
                ElevatedButton(
                    onPressed: _post,
                    child: new Text("Salvar")),
                ElevatedButton(
                    onPressed: null,
                    child: new Text("Alterar")),
                ElevatedButton(
                    onPressed: null,
                    child: new Text("Deletar")),
              ],
            ),
            new Expanded(
                child: new FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot){

                    String resultado;
                    switch( snapshot.connectionState ){
                      case ConnectionState.none :
                      case ConnectionState.waiting :
                        return new Center(
                          child: new CircularProgressIndicator()
                        );
                        break;
                      case ConnectionState.active :
                      case ConnectionState.done :
                        print("conexao done");
                        if( snapshot.hasError ){

                          resultado = "Erro ao carregar os dados.\n${snapshot.error.toString()}";
                        }else {
                          return new ListView.builder(
                              itemBuilder: (context, index){

                                List<Post>? lista = snapshot.data;
                                Post post = lista![index];

                                return new ListTile(
                                  title: Text( _getValueInt(post.id) + " - " + _getValue(post.title)),
                                  subtitle: Text(_getValue(post.body)),
                                );
                              }
                          );
                        }
                        break;
                    }

                    return new Center(
                      child: new Text( resultado ),
                    );

                  },
                )
            ),

          ],
        ),
      )
    );
  }
}
