import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';
import 'package:template/app/data/api/api_client.dart';
import 'package:template/app/data/data_sources/local/sqflite/example_sources/IExampleLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/sqflite/example_sources/example_dao.dart';
import 'package:template/app/data/data_sources/local/sqflite/example_sources/example_sqflite_local_datasrc.dart';
import 'package:template/app/data/data_sources/local/sqflite/sqflite_db_provider.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/IUserLocalDataSrc.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_dao.dart';
import 'package:template/app/data/data_sources/local/sqflite/user_sources/user_sqflite_local_datasrc.dart';
import 'package:template/app/data/data_sources/remote/user_sources/IUserRemoteDataSrc.dart';
import 'package:template/app/data/data_sources/remote/user_sources/user_remote_datasrc.dart';
import 'package:template/app/data/models/example.dart';
import 'package:template/app/data/models/user.dart';
import 'package:template/app/services/example_service/IExampleService.dart';
import 'package:template/app/services/example_service/example_service.dart';
import 'package:template/app/services/user_service/IUserService.dart';
import 'package:template/app/services/user_service/user_service.dart';
import 'package:template/core/data_sources/local/IDbProvider.dart';
import 'package:template/core/data_sources/local/sqflite/IDao.dart';
import 'package:template/core/utils/network/INetworkInfo.dart';
import 'package:template/core/utils/network/NetworkInfo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    _configureApiClient();
    _configureLocalDb();
    _configureFeatures();
  }
  
  void _configureApiClient() {
    container.registerInstance(ApiClient(Dio(BaseOptions(
      contentType: "application/json",
      baseUrl: env['API_URL'],
    ))));
  }

  void _configureLocalDb() {
    container
        .registerSingleton<IDbProvider<dynamic>>((c) => SqfliteDbProvider());
  }

  void _configureFeatures() {
    _configureUserFeature();
    _configureExampleFeature();
  }

  void _configureUserFeature() {
    container.registerSingleton<IDao<User>>((c) => UserDao());
    container.registerSingleton<IUserLocalDataSrc>((c) => UserSqfliteDataSource(c<IDbProvider<dynamic>>(), c<IDao<User>>()));
    container.registerSingleton<IUserRemoteDataSrc>((c) => UserRemoteDataSrc(c<ApiClient>()));
    container.registerSingleton<IUserService>((c) => UserService(c<IUserLocalDataSrc>(), c<IUserRemoteDataSrc>()));
  }

  void _configureExampleFeature() {
    container.registerSingleton<IDao<Example>>((c) => ExampleDao());
    container.registerSingleton<IExampleLocalDataSrc>((c) =>
        ExampleSqfliteDataSource(c<IDbProvider<dynamic>>(), c<IDao<Example>>()));
    container.registerSingleton<IExampleService>((c) => ExampleService(c<IExampleLocalDataSrc>()));
  }


  

}
