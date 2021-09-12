import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Contatos.dart';
import 'package:projeto_whatsapp/Conversas.dart';

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
        length: 2,
        vsync: this,
        initialIndex: 0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "conversas",
            ),
            Tab(
              text: "contatos",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Conversas(),
          Contatos()
        ],
      ),
    );
  }

  _getUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;
  }
}
