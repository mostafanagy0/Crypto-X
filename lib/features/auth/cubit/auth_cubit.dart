import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LocalAuthentication auth;
  AuthCubit(this.auth) : super(AuthState.initial());
  Future<void> biometricSetup() async {
    emit(const AuthState.loading());
    try {
      // Check device support
      if (!await auth.isDeviceSupported()) {
        const message = "Device does not support biometrics";
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.red,
          fontSize: 16,
        );
        emit(const AuthState.failure(message: message));
        return;
      }
      // Check available biometrics
      final availableBiometrics = await auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        const message = "No biometrics available";
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.red,
          fontSize: 16,
        );
        emit(const AuthState.failure(message: message));
        return;
      }
      // Authenticate
      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: true,
      );
      if (didAuthenticate) {
        emit(const AuthState.success());
      } else {
        const message = "Authentication cancelled or failed";
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.red,
          fontSize: 16,
        );
        emit(const AuthState.failure(message: message));
      }
    } catch (e) {
      final message = "Authentication Error";
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        fontSize: 16,
      );
      emit(AuthState.failure(message: message));
    }
  }
}
