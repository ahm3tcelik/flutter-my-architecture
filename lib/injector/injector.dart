import 'package:connectivity/connectivity.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/data_sources/local/sqflite/sqflite_db_provider.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_dao.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_sqflite_local_datasrc.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/app/services/user_service/user_service.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';
import 'package:template/core/utils/network/NetworkInfo.dart';

// part 'injector.g.dart'; // flutter pub run build_runner build

class Injector {
  KiwiContainer container = KiwiContainer();

  void setup() {
    _configure();
  }

  void _configure() {
    _configureCore();
    _configureApp();
  }

  void _configureCore() {
    container.registerSingleton((c) => Connectivity());
    container
        .registerSingleton<INetworkInfo>((c) => NetworkInfo(c<Connectivity>()));
  }

  void _configureApp() {
    _configureLocalDb();
    _configureUserFeature();
  }

  void _configureLocalDb() {
    container
        .registerSingleton<IDbProvider<dynamic>>((c) => SqfliteDbProvider());
  }

  void _configureUserFeature() {
    container.registerSingleton<IDao<User>>((c) => UserDao());
    container.registerSingleton<IUserLocalDataSrc>((c) =>
        UserSqfliteDataSource(c<IDbProvider<dynamic>>(), c<IDao<User>>()));
    container.registerSingleton<IUserService>(
        (c) => UserService(c<IUserLocalDataSrc>()));
  }
}
