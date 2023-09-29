import 'base_entity.dart';

const String noteTable = 'note';

class Note{
  String id;
  String title;
  String creationDate;
  String lastModificationDate;
  String arrayPromemoria;
  String description;

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

  Note(
    this.id,
    this.title,
    this.creationDate,
    this.lastModificationDate,
    this.arrayPromemoria,
    this.description,
  );

  String getId() {
    return id;
  }

  void setId(String id1) {
    id = id1;
  }

  String getTitle() {
    return title;
  }

  void setTitle(String title1) {
    title = title1;
  }

  String getCreationDate() {
    return creationDate;
  }

  void setCreationDate(String creationDate1) {
    creationDate = creationDate1;
  }

  String getLastModificationDate() {
    return lastModificationDate;
  }

  void setLastModificationDate(String lastModificationDate1) {
    lastModificationDate = lastModificationDate1;
  }

  String getArrayPromemoria() {
    return arrayPromemoria;
  }

  void setArrayPromemoria(String arrayPromemoria1) {
    arrayPromemoria = arrayPromemoria1;
  }

  String getDescription() {
    return description;
  }

  void setDescription(String description1) {
    description = description1;
  }

  static Note fromJson(Map<String, dynamic> data) => Note(
      data['id'],
      data['title'],
      data['creationDate'],
      data['lastModificationDate'],
      data['arrayPromemoria'],
      data['description']);
}
