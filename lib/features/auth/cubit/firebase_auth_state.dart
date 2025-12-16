import 'package:crypto_x/features/auth/data/models/user_model.dart';

abstract class FirebaseAuthState {}

class FirebaseAuthInitial extends FirebaseAuthState {}

class FirebaseAuthLoading extends FirebaseAuthState {}

class FirebaseAuthSuccess extends FirebaseAuthState {
  final UserModel user;
  FirebaseAuthSuccess(this.user);
}

class FirebaseAuthFailure extends FirebaseAuthState {
  final String message;
  FirebaseAuthFailure(this.message);
}
