import 'dart:ui';

import 'base_entity.dart';
import 'identifiers/enum/priority.dart';
import 'identifiers/enum/color.dart';

class Note extends BaseEntity{
  static String id = BaseEntity.getId;
  static String title = BaseEntity.getTitle;
  static String creationDate = BaseEntity.getCreationDate;

  static String expirationDate = 'expirationDate';
  static String description = 'description';
  Priority priority = Priority.none;
  Color color = Color.none;

}

