import 'base_entity.dart';

const String noteTable = 'note';

class Note extends BaseEntity {
  static String id = BaseEntity.getId;
  static String title = BaseEntity.getTitle;
  static String creationDate = BaseEntity.getCreationDate;
  static String lastModificationDate = BaseEntity.getLastEditDate;
  static String arrayPromemoria = '';
  static String description = '';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate,
      'lastModificationDate': lastModificationDate,
      'arrayPromemoria': arrayPromemoria,
      'description': description
    };
  }

  String getId() {
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
}
