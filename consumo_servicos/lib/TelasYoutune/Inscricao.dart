import 'package:flutter/material.dart';

class Inscricao extends StatefulWidget {
  const Inscricao({Key? key}) : super(key: key);

  @override
  _InscricaoState createState() => _InscricaoState();
}

class _InscricaoState extends State<Inscricao> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text(
          "Inscrição",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ),
    );  }
}
