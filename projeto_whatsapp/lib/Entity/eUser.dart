import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_whatsapp/Constants/DbData.dart';

class eUser {

  late String _id;
  late String _name;
  late String _email;
  late String _password;
  late String _urlPerfilPicture;

  String get id => _id;
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get urlPerfilPicture => _urlPerfilPicture;

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      DbData.COLUMN_NAME : this.name,
      DbData.COLUMN_EMAIL : this.email
    };

    return map;
  }

  fromMap(Map<String, dynamic> map){

    this.name = map[DbData.COLUMN_NAME];
    this.email = map[DbData.COLUMN_EMAIL];
  }

  set id(String value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }

  set urlPerfilPicture(String value) {
    _urlPerfilPicture = value;
  }


  eUser? getUser() {

    FirebaseAuth auth = FirebaseAuth.instance;

    User? authUser = auth.currentUser;

    eUser user = eUser();
    user.id = authUser!.uid;
    user.urlPerfilPicture = "";

    return user;
  }

}