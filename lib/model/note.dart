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
    return {'id': id, 'title': title, 'desc': description,'CreationDate': creationDate, 'lastM': lastModificationDate };
  }
}
