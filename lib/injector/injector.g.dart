// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCore() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => Connectivity());
    container
        .registerSingleton<INetworkInfo>((c) => NetworkInfo(c<Connectivity>()));
  }

  @override
  void _configureServices() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<IUserService>(
        (c) => UserService(c<IUserLocalDataSrc>()));
  }

  @override
  void _configureLocalDataSources() {
    final KiwiContainer container = KiwiContainer();
    container
        .registerSingleton<IDbProvider<dynamic>>((c) => SqfliteDbProvider());
    container.registerSingleton((c) => UserDao());
    container.registerSingleton<IUserLocalDataSrc>(
        (c) => UserSqfliteDataSource(c<IDbProvider<dynamic>>(), c<UserDao>()));
  }
}
