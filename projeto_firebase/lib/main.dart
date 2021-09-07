import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() async {

  Firebase.initializeApp();

  runApp(
      MaterialApp(
          home: Home()
      ));
}


/*
  //Filtros
  QuerySnapshot querySnapshot = await db
      .collection("tipagem")
      .where("nome", isEqualTo: "planta").
      .where("nome", isEqualTo: "gelo")
      .getDocuments();


  print("Quantidade dados:" + querySnapshot.documents.length.toString());
  for (DocumentSnapshot item in querySnapshot.documents){
    print(item.data["nome"]);
  }
* */


/*
  //  Listando todos
   db.collection("tipagem").snapshots().listen(
          (event) {
            for (DocumentSnapshot item in event.documents){
              print(item.data["nome"]);
            }
      });
*/


/*
  QuerySnapshot querySnapshot = await db
                                      .collection("tipagem")
                                      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents){
    print(item.data["nome"]);
  }

  print(querySnapshot.documents.toString());
  */

/*
  //Buscar um dado
  DocumentSnapshot snapshot = await db.collection("tipagem").document("1").get();

  print(snapshot.data);
  */
/*
   //Deletar
    db.collection("tipagem").document("GZdAowZcdjV6iLYGW0Kr").delete();
  */

/*
    //Inserir - atualizar
   db.collection("tipagem")
      .document("GZdAowZcdjV6iLYGW0Kr")
      .setData(
        {
          "nome" : "FOGO"
        }
      );



  DocumentReference ref = await db.collection("tipagem").add(
      {
        "nome" : "fogo"
      }
  );*/

/*
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseAuth auth = FirebaseAuth.instance;
  String email = "gabryelghost@hotmail.com";
  String senha = "123456";


  auth.signInWithEmailAndPassword(
      email: email,
      password: senha).then((user) {
    print("Sucesso ao logar no sistema!! email: " + user.email);
  }).catchError((e){
    print("Falha ao logar!! email: " + e.toString());
  });




    //Verificar se o user está logado
  FirebaseUser user = await auth.currentUser();
  if(user != null){
    print("Email logado:" + user.email);
  } else {
    print("Usuário deslogado");
  }
*/
/*
  //Cadastrar um usuário
  auth.createUserWithEmailAndPassword(
      email: email,
      password: senha
  ).then((user) {
    print("Sucesso ao criar novo usuário!! email: " + user.email);
  }).catchError((e){
    print("Falha ao criar novo usuário!! email: " + e.toString());
  });
*/

