import 'dart:js';

import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Login.dart';
import 'package:projeto_whatsapp/Register.dart';

import 'Home.dart';
import 'Util/Utils.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings set){

    switch(set.name){
      case "/":
      case "/login":
        return MaterialPageRoute(
            builder: (_) => Login()
        );
      case "/cadastro" :
        return MaterialPageRoute(
            builder: (_) => Register()
        );
      case "/home" :
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      default :
        _routeNotFound();
    }
  }

  static void _routeNotFound() {
    Utils.showDialogBox("Tela não encontrada", context);
  }
}