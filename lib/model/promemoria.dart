import 'identifiers/enum/color.dart';
import 'identifiers/enum/priority.dart';

const String promemoriaTable = 'promemoria';

class Promemoria {
  String id = '';
  String title = '';
  String creationDate = '';
  String lastModificationDate = '';
  String expirationDate = '';
  String? arrayPromemoria = '';
  String description = '';
  String priority = '';
  String color = '';

  Promemoria(
      this.id,
      this.title,
      this.creationDate,
      this.lastModificationDate,
      this.expirationDate,
      this.arrayPromemoria,
      this.description,
      this.priority,
      this.color);

  Promemoria.newConstructor(
      this.title,
      this.creationDate,
      this.lastModificationDate,
      this.expirationDate,
      this.arrayPromemoria,
      this.description,
      this.priority,
      this.color
    );

  Promemoria.today(
      this.title,
      this.creationDate,
      this.lastModificationDate,
      this.expirationDate,
      this.description,
  );

  Promemoria.inbox(
      this.title,
      this.creationDate,
      this.lastModificationDate,
      this.description,
  );

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

  String getExpirationDate() {
    return expirationDate;
  }

  void setExpirationDate(String expirationDate1) {
    expirationDate = expirationDate1;
  }

  String? getArrayPromemoria() {
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

  String getPriority() {
    return priority;
  }

  void setPriority(Priority priority1) {
    priority = priority1.toString();
  }

  String getColor() {
    return color;
  }

  void setColor(Color color1) {
    color = color1.toString();
  }

  static Promemoria fromJson(Map<String, dynamic> data) {
    Promemoria promemoria = Promemoria(
        data['id'].toString(),
        data['title'],
        data['creationDate'],
        data['lastModificationDate'],
        data['expirationDate'],
        data['arrayPromemoria'],
        data['description'],
        data['priority'],
        data['color']);

    print(promemoria.getId().toString());

    return promemoria;
  }
}
