import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({Key? key}) : super(key: key);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela Secundaria"),
          backgroundColor: Colors.purple,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              ElevatedButton(
                child: Text("Ir para a segunda tela"),
                onPressed: (){

                },
              )
            ],
          ),
        )


    );
  }
}
