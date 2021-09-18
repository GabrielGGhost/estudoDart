import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Screens/Login.dart';
import 'package:projeto_whatsapp/Screens/Register.dart';
import 'Configurations.dart';
import '../Constants/Routes.dart';
import 'Home.dart';
import 'Perfil.dart';
import '../Util/Utils.dart';

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
      case Routes.CONFIGURATIONS :
        return MaterialPageRoute(
            builder: (_) => Configurations()
        );
      case Routes.PERFIL :
        return MaterialPageRoute(
            builder: (_) => Perfil()
        );
      case Routes.CHAT :
        return MaterialPageRoute(
            builder: (_) => Chat()
        );
      default :
        _routeNotFound();
    }
  }

  static void _routeNotFound() {
    Utils.showToast("Erro ao acessar a tela", Colors.redAccent);
  }
}