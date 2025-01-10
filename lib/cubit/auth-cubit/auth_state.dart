part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class TermsAndConditionUpdateCheckBoxState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignInSuccuss extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String errorMassage;

  SignInFailure({required this.errorMassage});
}

final class SignUpSuccuss extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errorMassage;

  SignUpFailure({required this.errorMassage});
}
