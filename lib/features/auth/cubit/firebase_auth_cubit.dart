import 'package:crypto_x/features/auth/data/repos/firebase_auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_auth_state.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  final FirebaseAuthRepository repository;

  FirebaseAuthCubit(this.repository) : super(FirebaseAuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(FirebaseAuthLoading());
    try {
      final user = await repository.login(email: email, password: password);
      emit(FirebaseAuthSuccess(user));
    } catch (e) {
      emit(FirebaseAuthFailure(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(FirebaseAuthLoading());
    try {
      final user = await repository.register(email: email, password: password);
      emit(FirebaseAuthSuccess(user));
    } catch (e) {
      emit(FirebaseAuthFailure(e.toString()));
    }
  }
}
