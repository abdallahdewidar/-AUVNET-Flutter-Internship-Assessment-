// register_usecase.dart

import '../repositories/auth.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<void> call(String email, String password) {
    return repository.register(email, password);
  }
}
