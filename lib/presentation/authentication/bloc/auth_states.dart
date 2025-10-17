// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../repository/data model/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final bool? isLoadingspin;
  AuthLoading({
    this.isLoadingspin,
  });
}

class AuthAuthenticated extends AuthState {
  final UserModel? user;
  final String? message;
  final String? username;
  AuthAuthenticated([this.user, this.message, this.username]);
}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess(this.message);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class ProfileLoggedOut extends AuthState {
  ProfileLoggedOut();
}
