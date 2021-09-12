import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Constants/DbData.dart';
import 'Entity/eUser.dart';
import 'Styles/ButtonStyles.dart';
import 'Util/Utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cadastro),
      ),
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
                    getPhoto("usuario"),
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _nameController,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: AppLocalizations.of(context)!.nome,
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
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
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
                        AppLocalizations.of(context)!.cadastrarSe,
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

  void showToast(String message, [color]){
    Utils.showToast(message, color);
  }

  void _checkFields() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    bool sucess = false;
    if(name.isNotEmpty){
      if (email.isNotEmpty && email.contains("@")) {
        if(password.isNotEmpty && password.length > 6) {
          sucess = true;

          eUser user = eUser();
          user.name = name;
          user.email = email;
          user.password = password;

          _registerUser(user);
        } else {
          _message = AppLocalizations.of(context)!.senhaDeveTerAoMenos7Caracteres;
        }
      } else {
        _message =  AppLocalizations.of(context)!.emailValidoNecessario;
      }
    } else {
      _message = AppLocalizations.of(context)!.nomeNecessarioParaCadastro;
    }

    if(_message != ""){
      var color;

      if(sucess){
       color = Colors.green;
      } else {
        color = Colors.redAccent;
      }
      showToast(_message, color);
    }
    _message = "";
  }

  void _registerUser(eUser user) {

    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password
    ).then((fireBaseUser){

      //Salvar dados do usuário
      FirebaseFirestore db = FirebaseFirestore.instance;
      
      db.collection(DbData.TABLE_USER)
        .doc(fireBaseUser.user!.uid)
        .set(
          user.toMap()
        );

      showToast(AppLocalizations.of(context)!.usuarioCadastradoComSucesso, Colors.green);
      Navigator.pop(context);
    }).catchError((error){
      Utils.showAuthError(error.code, context);
    });
  }
}
