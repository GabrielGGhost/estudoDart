import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Chamadas.dart';
import 'package:projeto_whatsapp/Constants/Routes.dart';
import 'package:projeto_whatsapp/Contatos.dart';
import 'package:projeto_whatsapp/Conversas.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Status.dart';
import 'Constants/Menu.dart';
import 'Util/Utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 1
    );
  }

  _menuChoice(itemChoice) {
    switch(itemChoice){
      case Menu.SAIR:
        _unlogUser();

        break;
    }
  }

  _unlogUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacementNamed(context, Routes.LOGIN);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.whatsApp),
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
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: AppLocalizations.of(context)!.conversas.toString().toUpperCase(),
            ),
            Tab(
              text: AppLocalizations.of(context)!.conversas.toString().toUpperCase(),
            ),
            Tab(
              text: AppLocalizations.of(context)!.chamadas.toString().toUpperCase(),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text("Câmera"),
          Conversas(),
          Status(),
          Chamadas()
        ],

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.message_sharp),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Contatos()
              )
          );
        },
      ),
    );
  }

  _getUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;
  }
}
