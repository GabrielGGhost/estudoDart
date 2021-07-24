import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool? _ativadoOnePice = false,
        _ativadoPokemon = false,
        _ativadoAttackOnTitan = false,
        _selecionadoTodos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
                "Animes para assistir:",
              style: TextStyle(
                fontSize: 26,
                fontFamily: "Arial",
              ),
            ),
            CheckboxListTile(
              title: Text("One piece"),
              value: _ativadoOnePice,
                activeColor: Colors.purple,
                subtitle: Text("Anime do piratinha que estica"),
                secondary: Icon(Icons.add_comment),
                onChanged: (bool? valor){
                  setState(() {
                    _ativadoOnePice = valor;
                  });
                },
            ),
            CheckboxListTile(
              title: Text("Pokemon"),
              value: _ativadoPokemon,
              activeColor: Colors.purple,
              subtitle: Text("O menino que não envelhece e nunca ganha"),
              secondary: Icon(Icons.add_comment),
              onChanged: (bool? valor){
                setState(() {
                  _ativadoPokemon = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Attack on titan"),
              value: _ativadoAttackOnTitan,
              activeColor: Colors.purple,
              subtitle: Text("To chorando nesse anime"),
              secondary: Icon(Icons.add_comment),
              onChanged: (bool? valor){
                setState(() {
                  _ativadoAttackOnTitan = valor;
                });
              },
            ),

            ElevatedButton(onPressed: (){
              setState(() {
                _selecionadoTodos = !_selecionadoTodos!;

                if(_selecionadoTodos == true){
                  print("Todos foram selecionados");
                } else {
                  print("Todos foram desselecionados");
                }


                _ativadoAttackOnTitan = _selecionadoTodos;
                _ativadoPokemon = _selecionadoTodos;
                _ativadoOnePice = _selecionadoTodos;
              });
            },
                child: Text("Selecionar todos"))
            /*
            Text("One piece"),
            Checkbox(
                value: _ativado,
                onChanged: (bool? valor){
                  setState(() {
                    _ ativado = valor;
                  });
                },
            )*/
          ],
        ),
      ),
    );
  }
}
