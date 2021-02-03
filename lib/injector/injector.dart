import 'package:connectivity/connectivity.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/data_sources/local/IDbProvider.dart';
import 'package:template/app/data/data_sources/local/sqflite/sqflite_db_provider.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_dao.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_sqflite_local_datasrc.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/app/services/user_service/user_service.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';
import 'package:template/core/utils/network/NetworkInfo.dart';

part 'injector.g.dart'; // flutter pub run build_runner build

abstract class Injector {

  static KiwiContainer container;
  static final resolve = container.resolve;

  static void setup() {
    _$Injector()._configure();
  }

  void _configure() {
    _configureCore();
    _configureApp();
  }
  
  @Register.singleton(Connectivity)
  @Register.singleton(INetworkInfo, from: NetworkInfo)
  void _configureCore();

  void _configureApp() {
    _configureServices();
    _configureLocalDataSources();
  }

  @Register.singleton(IUserService, from: UserService)
  void _configureServices();

  @Register.singleton(IDbProvider, from: SqfliteDbProvider)
  @Register.singleton(UserDao)
  @Register.singleton(IUserLocalDataSrc, from: UserSqfliteDataSource)
  void _configureLocalDataSources();

}