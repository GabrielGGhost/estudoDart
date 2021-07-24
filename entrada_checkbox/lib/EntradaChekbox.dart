import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({Key? key}) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool? _ativado = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [

            CheckboxListTile(
              title: Text("One piece"),
              value: _ativado,
                activeColor: Colors.purple,
                subtitle: Text("Anime do piratinha que estica"),
                secondary: Icon(Icons.add_comment),
                onChanged: (bool? valor){
                  setState(() {
                    _ativado = valor;
                  });
                },
            )

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
