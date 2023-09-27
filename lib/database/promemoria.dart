import 'base_entity.dart';
import 'identifiers/enum/priority.dart';

class Note extends BaseEntity{
  static String id = BaseEntity.getId;
  static String title = BaseEntity.getTitle;
  static String creationDate = BaseEntity.getCreationDate;
  static String expirationDate = 'expirationDate';
  Priority priority = Priority.low;
}

