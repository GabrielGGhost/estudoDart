import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Constantes.dart';

void main() => runApp(
    MaterialApp(
      home: Home(),
    )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async {

    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var bd = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (db, dbVersaoRecente){
          String sql = "CREATE TABLE animes (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, protagonista VARCHAR) ";
          db.execute(sql);
        }
    );

    return bd;
    print("aberto: " + bd.isOpen.toString() );

  }

  _findAllAnimes() async {
    Database db = await _recuperarBancoDados();

    String sql = "SELECT * FROM " + Constantes.TABELA_ANIMES;
    List animes = await db.rawQuery(sql);

    _imprimirAnimes(animes);
  }

  _findAnimeByPK(int id) async {

    Database db = await _recuperarBancoDados();

    print("Buscando......");
    List animes = await db.query(
      Constantes.TABELA_ANIMES,
      columns: ["id", "nome", "protagonista"],
      where: "id = ?",
      whereArgs: [id]
    );

    _imprimirAnimes(animes);
  }


  _deleteUsuario(int id) async {

    Database db = await _recuperarBancoDados();

    db.delete(
      Constantes.TABELA_ANIMES,
      where: "id = ?",
      whereArgs: [id]
    );

    print("Anime deletado com sucesso!");
  }

  _imprimirAnimes(List animes){

    print("Exibindo dados");
    print("@===========================================@");
    if(animes != null){
      for( var anime in animes){
        print("Id:" + anime['id'].toString());
        print("Protagonista:" + anime['protagonista']);
        print("Nome:" + anime['nome']);
        print('\n');
      }
    } else {
      print("Nenhum anime encontrado!");
    }

    print("@===========================================@");
  }

  _insert() async {

    Database bd = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Boku no Heor",
      "protagonista" : "Izuky Midorya"
    };

    int id = await bd.insert("animes", dadosUsuario);
    print("Salvo: $id " );

  }

  _update(int id) async{
    Database db = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome" : "Death Note",
      "protagonista" : "Light Yagami"
    };
    print("Atualizando anime........");
    int retorno = await db.update(
                      Constantes.TABELA_ANIMES,
                      dadosUsuario,
                      where: "id = $id"
                  );

    print("$retorno anime(s) atualizado(s)");
  }

  _save(int id){

    if(id != 0){
      _update(id);
    } else {
      _insert();
    }

    _findAllAnimes();
  }

  @override
  Widget build(BuildContext context) {
    _save(0);

    return Container();
  }
}

