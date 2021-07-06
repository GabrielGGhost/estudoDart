import 'package:flutter/material.dart';

void main(){

    runApp(new MaterialApp(
      title: "Primeiro APP",
      home: homeStateful(),
    ));
}

class homeStateful extends StatefulWidget {
  const homeStateful({Key? key}) : super(key: key);

  @override
  _homeStatefulState createState() => _homeStatefulState();
}

class _homeStatefulState extends State<homeStateful> {

  var _acesso = "Acesso Pendente!";
  var _buttonText = "Acessar o Sistema";
  @override
  Widget build(BuildContext context) {

    print("Build chamado");

    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook"),
        backgroundColor:  Colors.purple,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _acesso = "Acesso Permitido!";
                      _buttonText = "Sistema Acessado!";
                    });
                  },
                child: Text(_buttonText),
              ),
          ),
          Text(_acesso)
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color:  Colors.deepPurpleAccent,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Text("Bem vindo!"),
            ],
          ),
        ),
      ),
    );;
  }
}

