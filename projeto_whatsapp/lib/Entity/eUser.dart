import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projeto_whatsapp/Constants/DbData.dart';
import 'package:projeto_whatsapp/Util/Utils.dart';

class eUser {

  String? _id;
  String? _name;
  String? _email;
  String? _password;
  String? _urlPerfilPicture;

  String get id => _id!;
  String get name => _name!;
  String get email => _email!;
  String get password => _password!;
  String get urlPerfilPicture => _urlPerfilPicture!;

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      DbData.COLUMN_NAME : this.name,
      DbData.COLUMN_EMAIL : this.email
    };

    return map;
  }

  fromMap(Map<String, dynamic> map){

    this.name = map[DbData.COLUMN_NAME]!;
    this.email = map[DbData.COLUMN_EMAIL]!;
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


  getUser() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    User? authUser = auth.currentUser;
    FirebaseStorage str = FirebaseStorage.instance;

    this.id = authUser!.uid;



    Map map = _getUserData as Map;

    this.name = "Teste";
    this.urlPerfilPicture = "";

    //fromSnapshot(map);
  }
  bool isNull(String str){
    return Utils.isNull(str);
  }

  Future<Map> _getUserData(String id) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snap = await db.collection(DbData.TABLE_USER)
        .doc(this.id)
        .get();

    return snap.data() as Map;
  }
}