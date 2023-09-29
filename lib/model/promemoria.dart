import 'base_entity.dart';
import 'identifiers/enum/color.dart';
import 'identifiers/enum/priority.dart';

const String promemoriaTable = 'promemoria';

class Promemoria extends BaseEntity {
  static String expirationDate = '';
  static String arrayPromemoria = '';
  String description = '';
  static Priority priority = Priority.none;

  static Color color = Color.none;

  Promemoria(String description){
    this.description = description;
  }

}
