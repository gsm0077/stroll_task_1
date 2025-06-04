// auth_repository.dart
abstract class AuthRepository {
  Future<String> login(String email, String password);
}
