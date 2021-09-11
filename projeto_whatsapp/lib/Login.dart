import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Util/Utils.dart';
import 'Register.dart';
import 'Styles/ButtonStyles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //Define um container para os componentes
      body: Container( // Define um container como corpo
        decoration: BoxDecoration(
          color: Color(0xff075E54)
        ),
        padding: EdgeInsets.all(16), //Espaça 16px para cada lado
        child: Center( //Define todos os componentes para o centro
          child: SingleChildScrollView( //Define um scroll para a tela ao digitar
            child: Column( // Define um container para armazenar os dados
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 32), //Define uma distância de 32 pixeis de baixo pra cima
                    child: Image.asset( //Definindo o path, e dimensões da imagem do logo
                      getPhoto("logo"),
                      width: 200,
                      height: 150,
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: AppLocalizations.of(context)!.email,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: AppLocalizations.of(context)!.senha,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: ElevatedButton(
                    style: loginButton,
                    child: Text(
                      AppLocalizations.of(context)!.entrar,
                      style: (
                        TextStyle(
                          color: Colors.white, fontSize: 20
                        )
                      ),
                    ),
                    onPressed: (){

                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      AppLocalizations.of(context)!.naoPossuiContaCadastrese,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register()
                          )
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getPhoto(String imageName, [String? ext]) {
    return Utils.getPhoto(imageName, ext);
  }
}
