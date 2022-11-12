part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

class AuthorizationLoginChanged extends AuthorizationEvent {
  const AuthorizationLoginChanged(this.login);

  final String login;

  @override
  List<Object> get props => [login];
}

class AuthorizationPasswordChanged extends AuthorizationEvent {
  const AuthorizationPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class AuthorizationSubmitted extends AuthorizationEvent {
  const AuthorizationSubmitted();
}
