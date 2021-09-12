import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Constants/Routes.dart';
import 'Entity/eUser.dart';
import 'Home.dart';
import 'Util/Utils.dart';
import 'Register.dart';
import 'Styles/ButtonStyles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _message = "";


  checkSignedUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;

    User? user = await auth.currentUser;

    if(user != null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
    }

  }

  @override
  void initState() {
    checkSignedUser();
    super.initState();
  }

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
                    controller: _emailController,
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
                    controller: _passwordController,
                    obscureText: true,
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
                      _checkFields();
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
                      _emailController.text = "";
                      _passwordController.text = "";
                      Navigator.pushNamed(context, Routes.REGISTER);
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

  _showDialog(String message, context) {
    Utils.showDialogBox(message, context);
  }

  void _checkFields() {

    String email = _emailController.text;
    String password = _passwordController.text;
    bool sucess = false;

    if (email.isNotEmpty && email.contains("@")) {
      if(password.isNotEmpty && password.length > 6) {
        sucess = true;

        eUser user = eUser();
        user.email = email;
        user.password = password;

        _signInUser(user);
      } else {
        _message = AppLocalizations.of(context)!.senhaDeveTerAoMenos7Caracteres;
      }
    } else {
      _message =  AppLocalizations.of(context)!.emailValidoNecessario;
    }

    if(_message != ""){
      var color;

      if(sucess){
        color = Colors.green;
      } else {
        color = Colors.redAccent;
      }
      _showDialog(_message, context);
    }
    _message = "";
  }

  void _signInUser(eUser user) {

    FirebaseAuth auth = FirebaseAuth.instance;


    auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password
    ).then((value){
      Navigator.pushReplacementNamed(context, Routes.HOME);
    }).catchError((error){
      Utils.showAuthError(error.code, context);
    });
  }



}
