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

  Post post = new Post.empty();
  Future<List<Post>>? _recuperarPostagens() async{

    String _tipo = "posts";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados Web"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot){

          String resultado;
          switch( snapshot.connectionState ){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return CircularProgressIndicator();
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              print("conexao done");
              if( snapshot.hasError ){

                resultado = "Erro ao carregar os dados.\n${snapshot.error.toString()}";
              }else {
                return ListView.builder(
                    itemBuilder: (context, index){

                      List<Post>? lista = snapshot.data;
                      Post post = lista![index];

                      return ListTile(
                        title: Text( _getValueInt(post.id) + " - " + _getValue(post.title)),
                        subtitle: Text(_getValue(post.body)),
                      );
                    }
                );
              }
              break;
          }

          return Center(
            child: Text( resultado ),
          );

        },
      )
    );
  }
}
