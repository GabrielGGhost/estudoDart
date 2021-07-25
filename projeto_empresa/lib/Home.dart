import 'package:flutter/material.dart';
import 'package:projeto_empresa/TelaClientes.dart';
import 'package:projeto_empresa/TelaContato.dart';
import 'package:projeto_empresa/TelaEmpresa.dart';
import 'package:projeto_empresa/TelaServico.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirEmpresa(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaEmpresa()
        )
    );
  }

  void _abrirServico(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaServico()
        )
    );
  }

  void _abrirCliente(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaClientes()
        )
    );
  }

  void _abrirContato(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TelaContato()
        )
    );
  }

  void _abrirTela(int tela){
    switch(tela){
      case 1:
        _abrirEmpresa();
        break;
      case 2:
        _abrirServico();
        break;
      case 3:
        _abrirCliente();
        break;
    case 4:
      _abrirContato();
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATM Consultoria"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset("images/menu_empresa.png"),
                    onTap: (){
                      _abrirTela(1);
                    },
                  ),
                  GestureDetector(
                      child: Image.asset("images/menu_servico.png"),
                    onTap: (){
                        _abrirTela(2);
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Image.asset("images/menu_cliente.png"),
                      onTap: (){
                        _abrirTela(3);
                      },
                    ),
                    GestureDetector(
                      child: Image.asset("images/menu_contato.png"),
                      onTap: (){
                        _abrirTela(4);
                      },
                    ),
                  ],
                ),
              ),

        ],
      ),
    )
    );
  }
}