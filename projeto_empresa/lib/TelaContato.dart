import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({Key? key}) : super(key: key);

  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contato"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
          ), Row(
            children: [
              Image.asset("images/detalhe_contato.png"),
              Text("Conato")
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Email: Email@email.com"),
              Text(""),
              Text("Tel: (15) 99854-2365"),
              Text("Cel: (15) 3325-6984)")
            ],
          ),)
        ],
      ),
    );
  }
}
