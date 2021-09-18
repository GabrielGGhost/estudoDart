import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:projeto_whatsapp/Entity/eUser.dart';
import 'package:projeto_whatsapp/Util/Utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../Constants/Routes.dart';
import '../Styles/ButtonStyles.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_whatsapp/Constants/cImages.dart';
import 'package:projeto_whatsapp/Constants/DbData.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  TextEditingController _nameController = TextEditingController();

  XFile? image;
  User? userLogged;
  bool _uploadingImage = false;

  String? _idUser;
  String? _name = "";
  String? _pathPicture = "";

  @override
  void initState() {
    super.initState();

    _getUserLoggedData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.perfil),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                            backgroundImage:
                            _pathPicture != ""
                                ? NetworkImage(_pathPicture!)
                                : null                        ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _uploadingImage ? CircularProgressIndicator() : Container()
                          ],
                        ),
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
                                      //user["name"].toString().split(" ")[0],
                                      _name!,
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
                                IconButton(
                                  onPressed: (){
                                    _openDialogNameChange();
                                  },
                                  icon: Icon(
                                    Icons.create_rounded,
                                    size: 25,
                                    color: Colors.grey,
                                  ),)

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
                  onPressed: () {
                  },
                  child: Text("Remover Foto")
              ),
              TextButton(
                  onPressed: () {
                    _getPhoto(2);
                    Navigator.pop(context);
                  },
                  child: Text("Galeria")
              ),
              TextButton(
                  onPressed: () {
                    _getPhoto(1);
                  },
                  child: Text(AppLocalizations.of(context)!.camera)
              )
            ],
          );
        });
  }

  void _openDialogNameChange() {

    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(
              "Escolher nome",
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      hintText: "Nome",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32)
                      )
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")
              ),
              TextButton(
                  onPressed: () {
                    _changeName();
                  },
                  child: Text("Salvar",)
              )
            ],
          );
        });

  }

  _getPhoto(int src) async {

    ImagePicker _picker = ImagePicker();
    XFile? _selectedImage;
    switch(src){
      case 1:
        _selectedImage = await _picker.pickImage(source: ImageSource.camera);
        break;
      case 2:
        _selectedImage = await _picker.pickImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      image = _selectedImage;
      if(image != null){
        setState(() {
          _uploadingImage = true;
        });
        _uploadImage();
      }
    });
  }

  void _uploadImage() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseStorage store = FirebaseStorage.instance;
    Reference root = store.ref();
    Reference file = root.child(cImages.STORAGE_PATH)
                         .child("${_idUser}." + cImages.TYPE_JPG);

    UploadTask task = file.putFile(File(image!.path));

    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {

      switch(taskSnapshot.state){
        case TaskState.running:

          break;
        case TaskState.success:
          _recuperarUrlImagem(taskSnapshot);
          break;

      }
    });

  }

  Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {

    String url = await taskSnapshot.ref.getDownloadURL();

    setState(() {
      _uploadingImage = false;
      //user!.urlPerfilPicture = url;
    });
    _updateDbUserData(url);
  }

  void _updateDbUserData(String url) {

    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> data = {
      DbData.COLUMN_URL_PICTURE : url
    };

    db.collection(DbData.TABLE_USER)
      .doc(_idUser)
      .update(data);
  }

  _getUserLoggedData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? usuarioLogado = await auth.currentUser;
    _idUser = usuarioLogado!.uid;

    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await db.collection(DbData.TABLE_USER)
                                        .doc( _idUser )
                                        .get();

    var data =  snapshot.data() as Map;

    setState(() {
      _name = _getColumn(DbData.COLUMN_NAME, data);
      _pathPicture = _getColumn(DbData.COLUMN_URL_PICTURE, data);
      _nameController.text = _name!;
    });

  }

  isNull(String str) {
    return Utils.isNull(str);
  }

  _getColumn(String str, Map data){
    return Utils.getColumn(str, data);
  }

  void _changeName() {

    bool success = false;
    String name = _nameController.text;
    if(name.length == 0){
      Utils.showToast("Não é possível salvar um nome vazio");
    } else {
      FirebaseFirestore db = FirebaseFirestore.instance;
      Map<String, dynamic> newData = {
        DbData.COLUMN_NAME : _nameController.text
      };

      db.collection(DbData.TABLE_USER)
          .doc(_idUser)
          .update(newData)
          .then((value) => {
            Utils.showToast("Nome atualizado com sucesso!"),
            success = true,
            setState(() {
              _name = _nameController.text;
            }),
          })
          .catchError((error) => {
            Utils.showToast("Falha ao atualizar o nome!!"),
            print("@==================@" + error)
          });

      Navigator.pop(context);
    }
  }

}
