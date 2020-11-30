import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:login/authentication_repository/authentication_repository.dart';
import 'package:login/user_repository/src/user_repository.dart';

@injectableInit
Future<void> configureLoginModuleInjection() async {
  GetIt.I.registerFactory<UserRepository>(() => UserRepository());
  GetIt.I.registerFactory<AuthenticationRepository>(() => AuthenticationRepository());
}