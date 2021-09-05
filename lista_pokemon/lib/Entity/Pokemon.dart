import 'package:lista_pokemon/Constantes/DataBase/Columns.dart';

class Pokemon {

  String? id;
  String? name;
  String? type1;
  String? type2;
  String? registration;

  Pokemon(this.name, this.type1, this.type2, this.registration);
  Pokemon.Edit(this.id, this.name, this.type1, this.type2);

  Map toMap(){

    Map<String, dynamic> map = {
      Columns.NAME : this.name,
      Columns.TYPE1 : this.type1,
      Columns.TYPE2 : this.type2,
      Columns.REGISTRATION : this.registration
    };

    if(this.id != null){
      map[Columns.ID] = this.id;
    }

    return map;
  }

  Pokemon.fromMap(Map map){

    this.id = map[Columns.ID].toString();
    this.name = map[Columns.NAME];
    this.type1 = map[Columns.TYPE1];
    this.type2 = map[Columns.TYPE2];
    this.registration = map[Columns.REGISTRATION];
  }

}