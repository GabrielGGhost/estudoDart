import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Constants/Routes.dart';
import 'Constants/cConfigurations.dart';
import 'Styles/IconsStyles.dart';


class Configurations extends StatefulWidget {
  const Configurations({Key? key}) : super(key: key);

  @override
  _ConfigurationsState createState() => _ConfigurationsState();
}

class _ConfigurationsState extends State<Configurations> {

  String pathPiture = "https://firebasestorage.googleapis.com/v0/b/whatsapp-9d115.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=f39cf87e-649a-4fb0-9a65-e7c508e98f10";




  @override
  Widget build(BuildContext context) {

    String? s = "Status do perfildsssssssssssssssssssssssssssssssssss".substring(0, 26) + "...";

    Map<String, dynamic> user = {
      "name": "Gabriel Santos",
      "status" : s
    };

    List<Map<String, String>> centerOptions = [
      {
        "name" : AppLocalizations.of(context)!.conta,
        "description" : AppLocalizations.of(context)!.privacidadeContaMudarNumero
      },
      {
        "name" : AppLocalizations.of(context)!.conversas,
        "description" : AppLocalizations.of(context)!.temasPapelDeParedeHistoricoDeConversas
      },
      {
        "name" : AppLocalizations.of(context)!.notificacoes,
        "description" : AppLocalizations.of(context)!.mensagensGruposChamadas
      },
      {
        "name" : AppLocalizations.of(context)!.armazenamentoDados,
        "description" : AppLocalizations.of(context)!.usoDeRedeDownloadAutomatico
      },
      {
        "name" : AppLocalizations.of(context)!.ajuda,
        "description" : AppLocalizations.of(context)!.centralDeAjudaFaleConoscoPoliticaDePrivacidade
      },
    ];

    List<Map<String, String>> bottomOptions = [
      {
        "name" : AppLocalizations.of(context)!.convidaUmAmigo
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.configuracoes),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: GestureDetector (
                            onTap: (){
                              Navigator.pushNamed(context, Routes.PERFIL);
                            },
                          ),
                          maxRadius: 35,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(pathPiture),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  user["name"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                user["status"],
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.qr_code,
                      size: 32,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),

              //Opções centrais
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: centerOptions.length,
                        itemBuilder: (context, index) {
                          
                          return Card(
                            elevation: 0,
                            semanticContainer: false,
                            borderOnForeground: false,
                            color: Colors.white,
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _getIconCenterOption(index),
                                ],
                              ),
                              title: Text(centerOptions[index]["name"]!),
                              subtitle: Text(centerOptions[index]["description"]!),
                              horizontalTitleGap: 10,
                              onTap: (){
                                _getCentralEvent(index);
                              },
                            ),
                          );
                        }),
                  ],
                )

                ),

              Divider(
                color: Colors.grey,
              ),

              //Opções inferiores
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bottomOptions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      semanticContainer: false,
                      borderOnForeground: false,
                      color: Colors.white,
                      child: ListTile(

                        leading: _getBottomIcon(index),
                        title: Text(bottomOptions[index]["name"]!),
                        onLongPress: () {},
                        onTap: () {},
                      ),
                    );
                  }
              ),

              Center(
                child: Column(
                  children: [
                    Text(
                      "from",
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
    );
  }

  _getIconCenterOption(int index) {

    return (index == 0 ? ACCOUNT_ICON :
            index == 1 ? MESSAGE_ICON :
            index == 2 ? NOTIFICATION_ICON :
            index == 3 ? DATA_USAGE_ICON :
            index == 4 ? HELP_ICON : HELP_ICON);

  }

  _getBottomIcon(int index) {
    return (index == 0 ? PEOPLE_ICON : PEOPLE_ICON);
  }

  void _getCentralEvent(int index) {}
}
