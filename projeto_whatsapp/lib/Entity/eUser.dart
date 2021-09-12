import 'package:projeto_whatsapp/Constants/DbData.dart';

class eUser {

  late String _name;
  late String _email;
  late String _password;

  String get name => _name;
  String get email => _email;
  String get password => _password;

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


  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }
}