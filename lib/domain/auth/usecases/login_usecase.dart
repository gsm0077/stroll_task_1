// login_usecase.dart

import 'package:stroll/domain/auth/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<String> call(String email, String password) {
    return repository.login(email, password);
  }
}
