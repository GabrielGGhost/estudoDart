import 'package:lista_pokemon/Constantes/DataBase/Access.dart';
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
    Print.warnMessage("INITIALIZATING DB");

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
    Print.warnMessage("CREATING TABLE");

    String sql = "CREATE TABLE " + Tables.POKEMON + " (" +
        " " + Tables.ID    + " INTEGER PRIMARY KEY AUTOINCREMENT," +
        " " + Tables.NAME  + " VARCHAR, "  +
        " " + Tables.TYPE1 + " VARCHAR, " +
        " " + Tables.TYPE2 + " VARCHAR, " +
        " " + Tables.REGISTRATION + " DATETIME)";
    await db.execute(sql);
    Print.warnMessage("TABLE CREATED");
  }

  Future<int> insert(Pokemon pokemon) async {
    var dataBase = await db;

    Print.warnMessage("INSERTING DATA INTO " + Tables.POKEMON);
    int id = await dataBase.insert(
        Tables.POKEMON,
        pokemon.toMap()
    );
    Print.warnMessage("DATA INSERTED SUCCESSFULLY");
    return id;
  }
}
