import 'package:flutter/material.dart';
import 'package:projeto_ingles/Constants/Pathes.dart';

class VowelScreen extends StatefulWidget {
  const VowelScreen({Key? key}) : super(key: key);

  @override
  _VowelScreenState createState() => _VowelScreenState();
}

class _VowelScreenState extends State<VowelScreen> {

  String _getPhotoPath(String name, [String? ext]){

    if(ext == null){
      return Pathes.IMAGE_PATH + name + ".png";
    }

    return Pathes.IMAGE_PATH + name + ext;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: [
        GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("cao")),
        ),
        GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("gato")),
        ),
        GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("leao")),
        ),GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("macaco")),
        ),GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("ovelha")),
        ),GestureDetector(
          onTap: (){},
          child: Image.asset( _getPhotoPath("vaca")),
        ),
      ],
    );
  }
}
