import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthEmailLoginLoading extends AuthState {}

class AuthEmailLoginSuccess extends AuthState {}

class AuthEmailLoginError extends AuthState {
  final String msg;

  const AuthEmailLoginError({required this.msg});
}

class AuthEmailRegisterLoading extends AuthState {}

class AuthEmailRegisterSuccess extends AuthState {}

class AuthEmailRegisterError extends AuthState {
  final String msg;

  const AuthEmailRegisterError({required this.msg});
}

class AuthGoogleLoginLoading extends AuthState {}

class AuthGoogleLoginSuccess extends AuthState {}

class AuthGoogleLoginError extends AuthState {
  final String msg;

  const AuthGoogleLoginError({required this.msg});
}
