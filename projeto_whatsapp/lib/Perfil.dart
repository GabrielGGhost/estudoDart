import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Constants/Routes.dart';
import 'Styles/ButtonStyles.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  String pathPiture = "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=f39cf87e-649a-4fb0-9a65-e7c508e98f10";

  Map<String, dynamic> user = {
    "name": "Gabriel Santos",
    "status" : "Teste"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.perfil),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      CircleAvatar(
                        child: GestureDetector (
                          onTap: (){
                            Navigator.pushNamed(context, Routes.PERFIL);
                          },
                        ),
                        maxRadius: 100,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(pathPiture),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 120),
                          child: ElevatedButton(
                              onPressed: () => {
                                _showPhotoSourceMenu()
                              },
                              child: Icon(
                                Icons.camera_alt,
                                size: 25,
                              ),
                              style: CameraButton,
                          )
                      ),
                    ]
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 65, 15, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.green,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    "Nome",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    user["name"].toString().split(" ")[0],
                                      style: TextStyle(
                                        fontSize: 16
                                      ),
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.esseNaoESeuNome,
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.create_rounded,
                                size: 25,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showPhotoSourceMenu() {

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              "Escolher foto",
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Remover Foto")
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Galeria")
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.camera)
              )
            ],
          );
        });
  }
}
