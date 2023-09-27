abstract class BaseEntity{
  static String id = 'id';
  static String title = 'Title';
  static String creationDate = 'CreationDate';
  static String lastEditDate = 'LastEditDate';
  
  static String get getId{
    return id;
  }
  static String get getTitle{
    return title;
  }
  static String get getCreationDate{
    return creationDate;
  }
  static String get getLastEditDate{
    return lastEditDate;
  }
}