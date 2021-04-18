import 'package:instapp/modules/login/domain/jwt.dart';
import 'package:instapp/modules/login/domain/repository/jwt_repository_abstract.dart';
import 'package:instapp/modules/login/domain/repository/jwt_storage_repository_abstract.dart';
import 'package:instapp/modules/login/domain/usecases/delete_jwt_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/get_or_refresh_token_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/login_usecase.dart';
import 'package:instapp/modules/login/domain/usecases/refresh_jwt_usecase.dart';
import 'package:instapp/modules/login/presentation/cubits/authentication_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'authentication_cubit_test.mocks.dart';

@GenerateMocks([JwtRepositoryAbstract, JwtStorageRepositoryAbstract])
void main() {
  group('Authentication use cases and AuthenticationCubit', () {
    final tokenExpirationDatetime = DateTime.now().add(Duration(days: 1));
    final accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c";
    final refreshToken = "refresh_token_123";
    late JwtRepositoryAbstract repo;
    late JwtStorageRepositoryAbstract storage;
    late DeleteJwtUserCase deleteJwtUserCase;
    late RefreshJwtUserCase refreshJwtUserCase;
    late GetOrRefreshTokenUseCase getOrRefreshTokenUseCase;
    late LoginUseCase loginUseCase;
    late AuthenticationCubit cubit;
    setUp(() {
      repo = MockJwtRepositoryAbstract();
      storage = MockJwtStorageRepositoryAbstract();
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, tokenExpirationDatetime));
      deleteJwtUserCase = DeleteJwtUserCase(storage);
      refreshJwtUserCase = RefreshJwtUserCase(storage, repo);
      getOrRefreshTokenUseCase = GetOrRefreshTokenUseCase(refreshJwtUserCase, storage);
      loginUseCase = LoginUseCase(repo);
      cubit = AuthenticationCubit(deleteJwtUserCase, refreshJwtUserCase, getOrRefreshTokenUseCase, loginUseCase);
    });

    test('deleted jwt token', () {
      deleteJwtUserCase.deleteJwt();
      verify(storage.deleteJwt()).called(1);
    });

    test('returns valid jwt token from GetOrRefreshTokenUseCase', () async {
      final jwt = await getOrRefreshTokenUseCase.getOrRefresh();
      verify(storage.getJwt()).called(1);
      verifyNever(repo.refreshToken(any));
      expect(jwt!.accessTokenExpirationDateTime, tokenExpirationDatetime);
    });

    test('returns refresh jwt token because actual is expires', () async {
      final expiredDate = DateTime.now().subtract(Duration(days: 1));
      final newExpirationDate = DateTime.now().add(Duration(days: 1));
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, expiredDate));
      when(repo.refreshToken(any)).thenAnswer((_) async => Jwt(accessToken, refreshToken, newExpirationDate));

      final jwt = await getOrRefreshTokenUseCase.getOrRefresh();
      verify(storage.getJwt()).called(2);
      verify(repo.refreshToken(any)).called(1);
      expect(jwt!.accessTokenExpirationDateTime, newExpirationDate);
    });

    test('returns null because cannot get access_token and refresh token', () async {
      when(storage.getJwt()).thenAnswer((_) async => null);
      when(repo.refreshToken(any)).thenAnswer((_) async => null);

      final jwt = await getOrRefreshTokenUseCase.getOrRefresh();
      verify(storage.getJwt()).called(1);
      verifyNever(repo.refreshToken(any));
      expect(jwt, null);
    });

    test('returns null because access_token is expired and cannot get refresh token', () async {
      final expiredDate = DateTime.now().subtract(Duration(days: 1));
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, expiredDate));
      when(repo.refreshToken(any)).thenAnswer((_) async => null);

      final jwt = await getOrRefreshTokenUseCase.getOrRefresh();
      verify(storage.getJwt()).called(2);
      verify(repo.refreshToken(any)).called(1);
      expect(jwt, null);
    });

    test('returns success login result', () async {
      when(repo.login()).thenAnswer((_) async => Jwt(accessToken, refreshToken, tokenExpirationDatetime));
      final login = await loginUseCase.logIn();
      expect(login.jwt!.accessTokenExpirationDateTime, tokenExpirationDatetime);
      expect(login.isSuccess, true);
    });

    test('returns failed login result', () async {
      when(repo.login()).thenThrow((_) async => Exception("exception for test"));
      final login = await loginUseCase.logIn();
      expect(login.isSuccess, false);
    });

    test('check flow: unknown, authenticated', () async {
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, tokenExpirationDatetime));
      expect(cubit.state.status, AuthenticationStatus.unknown);
      await cubit.checkIfJwtIsValid();
      verify(storage.getJwt()).called(1);
      expect(cubit.state.status, AuthenticationStatus.authenticated);
    });

    test('expects unauthenticated status because access token is expired', () async {
      final expired = DateTime.now().subtract(Duration(days: 1));
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, expired));
      when(repo.refreshToken(any)).thenAnswer((args) async => null);
      await cubit.checkIfJwtIsValid();
      verify(repo.refreshToken(any)).called(1);
      verify(storage.getJwt()).called(2);
      expect(cubit.state.status, AuthenticationStatus.unauthenticated);
    });

    test('expects authenticated status after refreshing expired access token.', () async {
      when(repo.refreshToken(any)).thenAnswer((args) async => Jwt(accessToken, refreshToken, tokenExpirationDatetime));
      final expired = DateTime.now().subtract(Duration(days: 1));
      when(storage.getJwt()).thenAnswer((_) async => Jwt(accessToken, refreshToken, expired));
      await cubit.checkIfJwtIsValid();
      verify(storage.getJwt()).called(2);
      verify(repo.refreshToken(any)).called(1);
      expect(cubit.state.status, AuthenticationStatus.authenticated);
    });
  });
}
