import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/Auth Repository.dart';
import 'authh_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final SupabaseAuthRepository repository;

  AuthCubit(this.repository) : super(const AuthState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await repository.login(email, password);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await repository.register(email, password);
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void reset() {
    emit(const AuthState());
  }
}

