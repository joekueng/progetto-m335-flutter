import 'base_entity.dart';
import 'identifiers/enum/color.dart';
import 'identifiers/enum/priority.dart';

const String promemoriaTable = 'promemoria';

class Promemoria extends BaseEntity {
  static String id = BaseEntity.getId;
  static String title = BaseEntity.getTitle;
  static String creationDate = BaseEntity.getCreationDate;
  static String lastModificationDate = BaseEntity.getLastEditDate;
  static String expirationDate = '';
  static String arrayPromemoria = '';
  static String description = '';
  static Priority priority = Priority.none;
  static Color color = Color.none;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate,
      'lastModificationDate': lastModificationDate,
      'expirationDate': expirationDate,
      'arrayPromemoria': arrayPromemoria,
      'description': description,
      'priority': priority,
      'color': color,
    };
  }

  String getId(){
    return id;
  }

  void setId(String id) {
    id = id;
  }

  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    title = title;
  }

  String getCreationDate() {
    return creationDate;
  }

  void setCreationDate(String creationDate) {
    creationDate = creationDate;
  }

  String getLastModificationDate() {
    return lastModificationDate;
  }

  void setLastModificationDate(String lastModificationDate) {
    lastModificationDate = lastModificationDate;
  }

  String getExpirationDate() {
    return expirationDate;
  }

  void setExpirationDate(String expirationDate) {
    expirationDate = expirationDate;
  }

  String getArrayPromemoria() {
    return arrayPromemoria;
  }

  void setArrayPromemoria(String arrayPromemoria) {
    arrayPromemoria = arrayPromemoria;
  }

  String getDescription() {
    return description;
  }

  void setDescription(String description) {
    description = description;
  }

  Priority getPriority() {
    return priority;
  }

  void setPriority(Priority priority) {
    priority = priority;
  }


}
