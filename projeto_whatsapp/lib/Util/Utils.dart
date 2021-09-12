import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projeto_whatsapp/Constants/ErrorCodes.dart';
import 'package:projeto_whatsapp/Constants/Images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Constants/Menu.dart';
import 'package:projeto_whatsapp/Styles/ButtonStyles.dart';

class Utils{

  /*
  * @Function : Retorna o path completo da imagem a ser exibida
  * @Params :
  *   imageName : Nome da imagem que será exibida
  *   ext : Extensão da imagem
  * */
  static String getPhoto(String imageName, [String? ext]){
    if(ext != null){
      return Images.IMAGE_PATH + imageName + "." + ext;
    } else {
      return Images.IMAGE_PATH + imageName + "." + Images.TYPE_PNG;
    }
  }

  /*
  * @Function : Mostra uma mensagem toast na tela
  * @Params :
  *   message : Mensagem que será exibida
  * */
  static void showToast(String message, [color]){

    Fluttertoast.cancel();
    if(color != null){
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: color
      );
    } else {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
      );
    }

  }

  static void showAuthError(code, context) {
    late String errorMessage;
    switch (code) {
      case ErrorCodes.ERROR_EMAIL_ALREADY_IN_USE:
      case ErrorCodes.ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL:
      case ErrorCodes.EMAIL_ALREADY_IN_USE:
        errorMessage = AppLocalizations.of(context)!.emailJaEmUso;
        break;
      case ErrorCodes.ERROR_WRONG_PASSWORD:
      case ErrorCodes.WRONG_PASSWORD:
      case ErrorCodes.ERROR_USER_NOT_FOUND:
      case ErrorCodes.USER_NOT_FOUND:
        errorMessage = AppLocalizations.of(context)!.cadastroNaoEncontrado;
        break;
      case ErrorCodes.ERROR_USER_DISABLED:
      case ErrorCodes.USER_DISABLED:
        errorMessage = AppLocalizations.of(context)!.cadastroDesativado;
        break;
      case ErrorCodes.ERROR_TOO_MANY_REQUESTS:
      case ErrorCodes.OPERATION_NOT_ALLOWED:
        errorMessage = AppLocalizations.of(context)!.excessoTentativas;
        break;
      case ErrorCodes.ERROR_OPERATION_NOT_ALLOWED:
      case ErrorCodes.OPERATION_NOT_ALLOWED:
        errorMessage = AppLocalizations.of(context)!.erroNoServidorTenteNovamenteMaisTarde;
        break;
      case ErrorCodes.ERROR_INVALID_EMAIL:
      case ErrorCodes.INVALID_EMAIL:
        errorMessage = AppLocalizations.of(context)!.emailInvalido;
        break;
      default:
        errorMessage = AppLocalizations.of(context)!.erroDesconhecido;
        break;
    }

    showToast(errorMessage, Colors.redAccent);
  }

  static void showDialogBox(String message, context) {

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
                message,
                style: TextStyle(
                  fontSize: 16
                ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.ok,)
              )
            ],
          );
        });
  }

  static List<String>? getItensPopUpMenu(context){
    return [
      Menu.NOVO_GRUPO,
      Menu.NOVA_TRANSMISSAO,
      Menu.APARELHOS_CONECTADOS,
      Menu.MENSAGENS_FAVORITAS,
      Menu.PAGAMENTOS,
      Menu.CONFIGURACOES,
      Menu.SAIR
    ];
  }


}