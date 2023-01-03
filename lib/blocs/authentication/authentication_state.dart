part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSignInWithFacebookInProgress extends AuthenticationState {}

class AuthenticationSignInWithFacebookSuccess extends AuthenticationState {}

class AuthenticationSignInWithFacebookFailure extends AuthenticationState {}

class AuthenticationSignInWithGoogleInProgress extends AuthenticationState {}

class AuthenticationSignInWithGoogleSuccess extends AuthenticationState {}

class AuthenticationSignInWithGoogleFailure extends AuthenticationState {}
