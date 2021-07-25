import 'package:flutter/material.dart';

class TelaClientes extends StatefulWidget {
  const TelaClientes({Key? key}) : super(key: key);

  @override
  _TelaClientesState createState() => _TelaClientesState();
}

class _TelaClientesState extends State<TelaClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
          ), Row(
            children: [
              Image.asset("images/detalhe_cliente.png"),
              Text("Clientes")
            ],
          ),
          Image.asset("images/cliente1.png"),
          Text("Texto aleatório aqui"),
          Image.asset("images/cliente2.png"),
          Text("Texto aleatório aqui")
        ],
      ),
    );
  }
}
