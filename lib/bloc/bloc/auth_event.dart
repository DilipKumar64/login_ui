part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

// class RegisterButtonClickedEvent extends AuthEvent {}

// class SignInButtonClickedEvent extends AuthEvent {}

class AppStarted extends AuthEvent {}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;

  RegisterUser({required this.email, required this.password});
}

class SignedIn extends AuthEvent {
  final String email;
  final String password;

  SignedIn({required this.email, required this.password});
}
