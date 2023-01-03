part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationSignedInWithFacebook extends AuthenticationEvent {}

class AuthenticationSignedInWithGoogle extends AuthenticationEvent {}
