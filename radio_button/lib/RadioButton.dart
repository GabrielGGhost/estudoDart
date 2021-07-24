import 'package:flutter/material.dart';


class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  String _escolhaUsuario = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
              Text("Masculino"),
              Radio(value: "M",
              groupValue: _escolhaUsuario,
              onChanged: (String? escolha){
                setState(() {
                  _escolhaUsuario = escolha!;
                });
              })
            ],
          ), Row(
          children: [
            Text("Feminino"),
            Radio(value: "F",
            groupValue: _escolhaUsuario,
            onChanged: (String? escolha){
              setState(() {
                _escolhaUsuario = escolha!;
              });
            })
            ],
            )
          ],
        )
      )
    );
  }
}
