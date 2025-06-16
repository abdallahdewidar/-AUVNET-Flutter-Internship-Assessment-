// supabase_auth_repository.dart
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/repositories/auth.dart';


class SupabaseAuthRepository implements AuthRepository {
  final _client = Supabase.instance.client;

  @override
  Future<void> login(String email, String password) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) throw Exception('Login failed');
  }

  @override
  Future<void> register(String email, String password) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
    );
    if (response.user == null) throw Exception('Register failed');
  }
}
