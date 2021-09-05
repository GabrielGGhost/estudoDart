import 'package:flutter/material.dart';
import 'package:projeto_abas/Telas/PrimeiraTela.dart';
import 'package:projeto_abas/Telas/SegundaTela.dart';
import 'package:projeto_abas/Telas/TerceiraTela.dart';

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
        length: 3,
        vsync: this,
      initialIndex: 1
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              //text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              //text: "E-mal",
              icon: Icon(Icons.email),
            ),
            Tab(
              //text: "Conta",
              icon: Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PrimeiraTela(),
          SegundaTela(),
          TerceiraTela(),
        ],
      ),
    );
  }
}
