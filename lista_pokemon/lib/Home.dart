import 'package:flutter/material.dart';
import 'package:lista_pokemon/Constantes/DataBase/Columns.dart';
import 'package:lista_pokemon/Entity/Pokemon.dart';
import 'package:lista_pokemon/Helper/PokemonHelper.dart';
import 'package:lista_pokemon/Utilites/MDateFormater.dart';

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
  List<Pokemon> _pokemon = [];

  _clearAll(){
    _nameControler.clear();
    _type1Controler.clear();
    _type2Controler.clear();
  }




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

  _fromDbDate(String date){

    return MDateFormatter.fromDbDate(date);
  }

  _save() async{

    String name = _nameControler.text;
    String t1 = _type1Controler.text;
    String t2 = _type2Controler.text;

    Pokemon pokemon = new Pokemon(name, t1, t2, DateTime.now().toString());
    int result = await _db.insert(pokemon);

    _clearAll();

    _findAllPokemon();

    print("Pokemon salvo com ID $result");
  }

  _findAllPokemon() async{

    List p = await _db.findAllPokemon();
    List<Pokemon> temporaryPokemon = [];

    for(var map in p){
      temporaryPokemon.add(Pokemon.fromMap(map));
    }

    setState(() {
      _pokemon = temporaryPokemon;
    });
    temporaryPokemon = [];
  }

  @override
  initState(){
    PokemonnHelper.warn("INIT STATE");
    super.initState();
    _findAllPokemon();
    PokemonnHelper.warn("INITED");
  }

  @override
  Widget build(BuildContext context) {

    PokemonnHelper.warn("NESSE MOMENTO POKEMON TEM " + _pokemon.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas anotações"),
        backgroundColor: Colors.lightGreen,
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _pokemon.length,
                itemBuilder: (context, index) {
                  final pokemon = _pokemon[index];

                  return Card(
                    child: ListTile(
                      title: Text( "${pokemon.name}"),
                      subtitle: Text("${pokemon.type1} - ${pokemon.type2} | ${_fromDbDate(pokemon.registration!)}"),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: _openRegistrationScreen
      ),
    );
  }
}

class DateFormatter {
}
