import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Entity/eChat.dart';

class Conversas extends StatefulWidget {
  const Conversas({Key? key}) : super(key: key);

  @override
  _ConversasState createState() => _ConversasState();
}

class _ConversasState extends State<Conversas> {

  List<eChat> chatList = [
    eChat("Ana Clara",
    "Olá tudo bem?",
    "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=05d12251-501b-40e4-abb1-a475f6472950"
    ),
    eChat("José Lucas",
        "Vou ver",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=f39cf87e-649a-4fb0-9a65-e7c508e98f10"
    ),
    eChat("Luciana",
        "Certo, vou verificar",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=5e190356-30db-4a75-8f69-88f23c7b4858"
    ),
    eChat("Paulo Souza",
        "Como fazer aquilo?",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=69aff613-2628-4228-95da-097c8bc3a679"
    ),
    eChat("Jamilton Souza",
        "Como estão as aulas??",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=bd8f4408-e791-4541-b888-60511dc47d97"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
          subtitle: Text(
            chat.message,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14
            ),
          ),
        );
      }
    );
  }
}
