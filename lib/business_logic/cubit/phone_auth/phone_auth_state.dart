part of 'phone_auth_cubit.dart';

@immutable
abstract class PhoneAuthState {}

class PhoneAuthCubitInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class ErrorOccured extends PhoneAuthState {
  final String errorMessage;

  ErrorOccured({required this.errorMessage});
}

class PhoneNumberSubmited extends PhoneAuthState {}

class PhoneOTPVerified extends PhoneAuthState {}
