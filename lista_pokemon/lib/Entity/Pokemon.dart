import 'package:lista_pokemon/Constantes/DataBase/Tables.dart';

class Pokemon {

  String? id;
  String? name;
  String? type1;
  String? type2;
  String? registration;

  Pokemon(this.name, this.type1, this.type2, this.registration);

  Map toMap(){

    Map<String, dynamic> map = {
      Tables.NAME : this.name,
      Tables.TYPE1 : this.type1,
      Tables.TYPE2 : this.type2,
      Tables.REGISTRATION : this.registration
    };

    if(this.id != null){
      map[Tables.ID] = this.id;
    }

    return map;

  }

}