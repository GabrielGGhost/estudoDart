import 'package:flutter/material.dart';
import 'package:lista_pokemon/Entity/Pokemon.dart';
import 'package:lista_pokemon/Helper/PokemonHelper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _db = PokemonnHelper();
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _type1Controler = TextEditingController();
  TextEditingController _type2Controler = TextEditingController();


  _openRegistrationScreen(){
    showDialog(context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Adicionar Pokemon"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _nameControler,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "Nome:",
                            hintText: "Nome do pokemon: "
                          ),
                        ), TextField(
                          controller: _type1Controler,
                          decoration: InputDecoration(
                              labelText: "Tipo Primário:",
                              hintText: "Informe o primeiro tipo: "
                          ),
                        ), TextField(
                          controller: _type2Controler,
                          decoration: InputDecoration(
                              labelText: "Tipo secundário:",
                              hintText: "Informe o segundo tipo: "
                          ),
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancelar")
                      ),
                      TextButton(
                          onPressed: (){
                            _save();
                          },
                          child: Text("Salvar")
                      ),
                    ],
                  );
                });
  }

  _save() async{

    String name = _nameControler.text;
    String t1 = _type1Controler.text;
    String t2 = _type2Controler.text;

    Pokemon pokemon = new Pokemon(name, t1, t2, DateTime.now().toString());
    int result = await _db.insert(pokemon);

    print("Pokemon salvo com ID $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body:  Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: _openRegistrationScreen
      ),
    );
  }
}
