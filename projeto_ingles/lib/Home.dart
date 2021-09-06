import 'package:flutter/material.dart';
import 'package:projeto_ingles/Subtelas/AnimalScreen.dart';
import 'package:projeto_ingles/Subtelas/NumberScreen.dart';
import 'package:projeto_ingles/Subtelas/VowelScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController? _menuControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menuControler = TabController(
        length: 3,
        vsync: this,
        initialIndex: 0
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _menuControler!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Aprende Inglês",
          textAlign: TextAlign.center,
        ),
        bottom: TabBar(
          controller: _menuControler,
          tabs: [
            Tab(
              text: "Animais"
            ),
            Tab(
                text: "Números"
            ),
            Tab(
                text: "Vogais"
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _menuControler,
        children: [
          AnimalScreen(),
          NumberScreen(),
          VowelScreen()
        ],
      ),
    );
  }
}
