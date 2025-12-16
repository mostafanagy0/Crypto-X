import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
part 'biometric_auth_state.dart';
part 'biometric_auth_cubit.freezed.dart';

class BiometricAuthCubit extends Cubit<BiometricAuthState> {
  final LocalAuthentication auth;
  BiometricAuthCubit(this.auth) : super(BiometricAuthState.initial());
  Future<void> biometricSetup() async {
    emit(const BiometricAuthState.loading());
    try {
      // Check device support
      if (!await auth.isDeviceSupported()) {
        const message = "Device does not support biometrics";
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.red,
          fontSize: 16,
        );
        emit(const BiometricAuthState.failure(message: message));
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
        emit(const BiometricAuthState.failure(message: message));
        return;
      }
      // Authenticate
      final didAuthenticate = await auth.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: true,
      );
      if (didAuthenticate) {
        emit(const BiometricAuthState.success());
      } else {
        const message = "Authentication cancelled or failed";
        Fluttertoast.showToast(
          msg: message,
          backgroundColor: Colors.red,
          fontSize: 16,
        );
        emit(const BiometricAuthState.failure(message: message));
      }
    } catch (e) {
      final message = "Authentication Error";
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        fontSize: 16,
      );
      emit(BiometricAuthState.failure(message: message));
    }
  }
}
