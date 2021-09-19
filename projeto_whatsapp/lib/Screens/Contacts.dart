import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Constants/Routes.dart';
import 'package:projeto_whatsapp/Entity/eChat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Screens/Login.dart';
import 'package:projeto_whatsapp/Entity/eUser.dart';
import '../Constants/DbData.dart';
import '../Constants/Menu.dart';
import '../Util/Utils.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  String? _idUser;
  String? _emailUser;

  Future<List<eUser>> _getAllContacts() async{

    List<eUser> userList = [];

    FirebaseFirestore.instance
                     .collection(DbData.TABLE_USER)
                     .get()
                     .then((QuerySnapshot querySnapshot) {
                       querySnapshot.docs.forEach((doc) {

                          eUser user = new eUser();
                          user.name = doc[DbData.COLUMN_NAME];
                          user.urlPerfilPicture = doc[DbData.COLUMN_URL_PICTURE];
                          user.email = doc[DbData.COLUMN_EMAIL];

                          if(_emailUser != user.email)
                            userList.add(user);
                       });
                      });

    return userList;
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserLoggedData();
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
      body: FutureBuilder<List<eUser>>(
        future: _getAllContacts(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: [
                    CircularProgressIndicator()
                  ],
                )
              );
            case ConnectionState.active:
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {

                  List<eUser> userList = snapshot.data!.toList();
                  eUser contact = userList[index];

                  return ListTile(
                    onTap: (){
                      Navigator.pushNamed(
                          context,
                          Routes.CHAT,
                        arguments: contact
                      );
                    },
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: contact.urlPerfilPicture != "" ?
                                        NetworkImage( contact.urlPerfilPicture ) :
                                        null
                    ),
                    title: Text(
                      contact.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  );
                }
            );
          }
        },
      )
    );
  }

  _getUserLoggedData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;
    _idUser = user!.uid;
    _emailUser = user.email;

  }
}
