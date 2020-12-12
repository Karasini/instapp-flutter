abstract class AuthRepository {

  Future<bool> logIn(String email, String password);
  Future<void> logOut();

}