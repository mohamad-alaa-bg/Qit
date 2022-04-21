part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginIsLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState({required this.error});
}
