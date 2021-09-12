import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Entity/eChat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Login.dart';

import 'Constants/Menu.dart';
import 'Util/Utils.dart';

class Contatos extends StatefulWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  _ContatosState createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {

  List<eChat> chatList = [
    eChat("Ana Clara",
        "Olá tudo bem?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=05d12251-501b-40e4-abb1-a475f6472950",
        "22:18"
    ),
    eChat("José Lucas",
        "Vou ver",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=f39cf87e-649a-4fb0-9a65-e7c508e98f10",
        "Ontem"
    ),
    eChat("Luciana",
        "Certo, vou verificar",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=5e190356-30db-4a75-8f69-88f23c7b4858",
        "21/05/2021"
    ),
    eChat("Paulo Souza",
        "Como fazer aquilo?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=69aff613-2628-4228-95da-097c8bc3a679",
        "20/05/2021"
    ),
    eChat("Jamilton Souza",
        "Como estão as aulas??",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=bd8f4408-e791-4541-b888-60511dc47d97",
        "20/05/2021"
    ),
  ];

  _menuChoice(itemChoice){
    switch(itemChoice){
      case Menu.SAIR:
        _unlogUser();
        break;
    }
  }

  void _unlogUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contatos),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.search)
          ),
          PopupMenuButton(
            onSelected: _menuChoice,
            itemBuilder: (context){
              return Utils.getItensPopUpMenu(context)!.map((String item) {
                return PopupMenuItem(
                    value: item,
                    child: Text(item)
                );
              }).toList();
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: chatList.length,
          itemBuilder: (context, index) {
            eChat chat = chatList[index];

            return ListTile(
              contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage( chat.picturePath ),
              ),
              title: Text(
                chat.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            );
          }
      )
    );
  }
}
