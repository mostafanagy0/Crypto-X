part of 'biometric_auth_cubit.dart';

@freezed
class BiometricAuthState with _$BiometricAuthState {
  const factory BiometricAuthState.initial() = _Initial;
  const factory BiometricAuthState.loading() = _Loading;
  const factory BiometricAuthState.success() = _Success;
  const factory BiometricAuthState.failure({required String message}) =
      _Failure;
}
