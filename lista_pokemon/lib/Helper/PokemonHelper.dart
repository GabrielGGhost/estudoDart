import 'package:lista_pokemon/Constantes/DataBase/Access.dart';
import 'package:lista_pokemon/Constantes/DataBase/Columns.dart';
import 'package:lista_pokemon/Constantes/DataBase/Tables.dart';
import 'package:lista_pokemon/Entity/Pokemon.dart';
import 'package:lista_pokemon/Utilites/Print.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PokemonnHelper{

  static final PokemonnHelper _anotationHelper = PokemonnHelper._internal();
  Database? _db;

  factory PokemonnHelper(){
    return _anotationHelper;
  }
  PokemonnHelper._internal(){

  }

  get db async {
    if( _db != null) {
      return _db;
    } else {
      return _db = await initDB();
    }
  }

  initDB() async{
    warn("INITIALIZATING DB");

    final dbPath = await getDatabasesPath();
    final dbLocal = join(dbPath, Access.DB_NAME);

    var db = await openDatabase(
        dbLocal,
        version: 1,
        onCreate: _onCreate);

    Print.warnMessage("DB INITIALIZATED");
    return db;
  }

  _onCreate(Database db, int version) async {
    warn("CREATING TABLE");

    String sql = "CREATE TABLE " + Tables.POKEMON + " (" +
        " " + Columns.ID    + " INTEGER PRIMARY KEY AUTOINCREMENT," +
        " " + Columns.NAME  + " VARCHAR, "  +
        " " + Columns.TYPE1 + " VARCHAR, " +
        " " + Columns.TYPE2 + " VARCHAR, " +
        " " + Columns.REGISTRATION + " DATETIME)";
    await db.execute(sql);
    warn("TABLE CREATED");
  }

  Future<int> insert(Pokemon pokemon) async {
    var dataBase = await db;

    warn("INSERTING DATA INTO " + Tables.POKEMON);
    int id = await dataBase.insert(
        Tables.POKEMON,
        pokemon.toMap()
    );
    warn("DATA INSERTED SUCCESSFULLY");
    return id;
  }

  findAllPokemon() async{
    var dataBase = await db;

    warn("SEARCHING ALL POKEMON");

    String sql = "SELECT * FROM " + Tables.POKEMON;
    List pokemon = [];

    if(dataBase != null){
      pokemon = await dataBase.rawQuery(sql);
    }

    warn("RETURNING ALL ${pokemon.length} POKEMON FOUND");
    return pokemon;
  }


  static warn(String msg){
    Print.warnMessage(msg);
  }
}
