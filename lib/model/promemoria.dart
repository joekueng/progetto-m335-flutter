import 'dart:ui';

import 'base_entity.dart';
import 'identifiers/enum/color.dart';
import 'identifiers/enum/priority.dart';

const String promemoriaTable = 'promemoria';

class Promemoria extends BaseEntity{
  static String id = BaseEntity.getId;
  static String title = BaseEntity.getTitle;
  static String creationDate = BaseEntity.getCreationDate;
  static String lastModificationDate = BaseEntity.getLastEditDate;
  static String expirationDate = '';
  static String description = '';

  static Priority priority = Priority.none;
  static Color color = Color.none;



}

