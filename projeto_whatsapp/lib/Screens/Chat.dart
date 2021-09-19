import 'package:flutter/material.dart';
import 'package:projeto_whatsapp/Entity/eUser.dart';
import 'package:projeto_whatsapp/Constants/cImages.dart';

class Chat extends StatefulWidget {

  eUser? contact;
  Chat(this.contact);

  @override
  _ChatState createState() => _ChatState();
}

TextEditingController? _controllerMessage = TextEditingController();
List<String> messagesList = [
  "Olá meu amigo, tudo bem?",
  "Tudo ótimo!!! e contigo?",
  "Estou muito bem!! queria ver uma coisa contigo, você vai na corrida de sábado?",
  "Não sei ainda :(",
  "Pq se você fosse, queria ver se posso ir com você...",
  "Posso te confirma no sábado? vou ver isso",
  "Opa! tranquilo",
  "Excelente!!",
  "Estou animado para essa corrida, não vejo a hora de chegar! ;) ",
  "Vai estar bem legal!! muita gente",
  "vai sim!",
  "Lembra do carro que tinha te falado",
  "Que legal!!"
];

class _ChatState extends State<Chat> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact!.name),
      ),
      body: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(cImages.IMAGE_PATH + "bg." + cImages.TYPE_PNG),
            fit: BoxFit.cover
          ) ,
        ),
        child: SafeArea(
          child: Column(
            children: [
              listView,
              messageBox
            ],
          ),
        ),
      ),
    );
  }

  var listView = Expanded(
      child: ListView.builder(
          itemCount: messagesList.length,
          itemBuilder : (_, index) {

            return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xffd2ffa5),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                      messagesList[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          }
      )
  );

  var messageBox = Container(
    padding: EdgeInsets.all(8),
    child: Row(
      children: [
        Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                controller: _controllerMessage,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Digite uma mensagem",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: (){

                      },
                    )
                ),
              ),
            )
        )
      ],
    ),
  );
}
