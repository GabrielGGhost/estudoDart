import 'package:projeto_whatsapp/Constants/Images.dart';

class Utils{

  static String getPhoto(String imageName, [String? ext]){
    if(ext != null){
      return Images.IMAGE_PATH + imageName + "." + ext;
    } else {
      return Images.IMAGE_PATH + imageName + "." + Images.TYPE_PNG;
    }
  }
}