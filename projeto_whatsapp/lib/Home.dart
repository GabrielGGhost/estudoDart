import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TabController? _tabController;

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

        ],
      ),
    );
  }


  _getUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await auth.currentUser;
  }
}
