import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/api/api_client.dart';
import 'package:template/app/data/data_sources/local/abstract/IExampleLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/abstract/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/concrete/sembast/example_sources/example_sembast_dao.dart';
import 'package:template/app/data/data_sources/local/concrete/sembast/sembast_db_provider.dart';
import 'package:template/app/data/data_sources/local/concrete/sembast/user_sources/user_sembast_dao.dart';
import 'package:template/app/data/data_sources/local/concrete/sembast/user_sources/user_sembast_local_datasrc.dart';
import 'package:template/app/data/data_sources/local/concrete/sqflite/example_sources/example_sqflite_local_datasrc.dart';
import 'package:template/app/data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import 'package:template/app/data/data_sources/remote/user_sources/user_remote_datasrc.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/example_service/IExampleService.dart';
import 'package:template/app/services/example_service/example_service.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/app/services/user_service/user_service.dart';
import 'package:template/core/data_sources/local/IDao.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';
import 'package:template/core/utils/network/NetworkInfo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    _configureApiClient();
    _configureLocalDb();
    _configureFeatures();
  }
  
  void _configureApiClient() {

    final dio = Dio(BaseOptions(
      baseUrl: env['API_URL'],
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));

    container.registerInstance(ApiClient(dio, baseUrl: env['API_URL']));

  }

  void _configureLocalDb() {
    // Change SembastDbProvider to SqfliteDbProvider if you want to use SQLite db
    container.registerSingleton<IDbProvider<dynamic>>((c) => SembastDbProvider());
  }

  void _configureFeatures() {
    _configureUserFeature();
    _configureExampleFeature();
  }

  void _configureUserFeature() {

    // Change UserSembastDao to UserSqfliteDao if you want to use SQLite db
    container.registerSingleton<IDao<User>>((c) => UserSembastDao());
    // Change UserSembastDataSource to UserSqfliteDataSource if you want to use SQLite db
    container.registerSingleton<IUserLocalDataSrc>((c) => UserSembastDataSource(c<IDbProvider<dynamic>>(), c<IDao<User>>()));
    container.registerSingleton<IUserRemoteDataSrc>((c) => UserRemoteDataSrc(c<ApiClient>()));
    container.registerSingleton<IUserService>((c) => UserService(c<IUserLocalDataSrc>(), c<IUserRemoteDataSrc>()));
  }

  void _configureExampleFeature() {
    // Change ExampleSembastDao to ExampleSqfliteDao if you want to use SQLite db
    container.registerSingleton<IDao<Example>>((c) => ExampleSembastDao());
    container.registerSingleton<IExampleLocalDataSrc>((c) =>
        ExampleSqfliteDataSource(c<IDbProvider<dynamic>>(), c<IDao<Example>>()));
    container.registerSingleton<IExampleService>((c) => ExampleService(c<IExampleLocalDataSrc>()));
  }


  

}
