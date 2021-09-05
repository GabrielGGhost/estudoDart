import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lista_pokemon/Constantes/DateFormatter/Formats.dart';
import 'package:lista_pokemon/Constantes/DateFormatter/Local.dart';


class MDateFormatter{

  static var format_D_M_Y = DateFormat(Formats.DD_MM_Y);

  /*
  * Param: Data no formato yyyy-MM-dd ||+ hh:mm:ss
  * e devolve no formato dd-MM-yyyy
  *
  *
  * */
  static String fromDbDate(String date){

    initializeDateFormatting(Local.PT_BR);

    DateTime convertedDate = DateTime.parse(date);
    String formattedDate = format_D_M_Y.format(convertedDate);

    return formattedDate;
  }

}