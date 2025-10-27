import 'package:equatable/equatable.dart';

abstract class AuthLoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends AuthLoginEvent {
  final String email;
  LoginEmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends AuthLoginEvent {
  final String password;
  LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class TogglePasswordVisibility extends AuthLoginEvent {}

class LoginSubmit extends AuthLoginEvent {}
