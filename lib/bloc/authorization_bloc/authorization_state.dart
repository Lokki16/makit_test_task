part of 'authorization_bloc.dart';

class AuthorizationState extends Equatable {
  final Login login;
  final Password password;
  final FormzStatus status;

  const AuthorizationState({
    this.login = const Login.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  AuthorizationState copyWith({
    Login? login,
    Password? password,
    FormzStatus? status,
  }) {
    return AuthorizationState(
      login: login ?? this.login,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [login, password, status];
}
