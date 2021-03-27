import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/core/data_sources/local/sqflite/ISqfliteDao.dart';


class DaoContext {

  static final container = KiwiContainer();

  // First, add custom data class to IoC container. (injector/injector.dart)
  // Then, add the list.
  // This operation required for auto creating table and auto define CRUD methods
  static List<ISqfliteDao?> daoList = [
    container<ISqfliteDao<User>>(),
    container<ISqfliteDao<Example>>()
  ];

}