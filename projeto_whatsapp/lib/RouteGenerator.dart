import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Login.dart';
import 'package:projeto_whatsapp/Register.dart';
import 'Constants/Routes.dart';
import 'Home.dart';
import 'Util/Utils.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings set){

    switch(set.name){
      case Routes.INITIAL_ROUTE:
      case Routes.LOGIN:
        return MaterialPageRoute(
            builder: (_) => Login()
        );
      case Routes.REGISTER :
        return MaterialPageRoute(
            builder: (_) => Register()
        );
      case Routes.HOME :
        return MaterialPageRoute(
            builder: (_) => Home()
        );
      default :
        _routeNotFound();
    }
  }

  static void _routeNotFound() {
    Utils.showToast("Erro ao acessar a tela", Colors.redAccent);
  }
}