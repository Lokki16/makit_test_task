part of 'authorization_bloc.dart';

class AuthorizationState extends Equatable {
  final FormzStatus status;
  final Login login;
  final Password password;

  const AuthorizationState({
    this.status = FormzStatus.pure,
    this.login = const Login.pure(),
    this.password = const Password.pure(),
  });

  AuthorizationState copyWith({
    FormzStatus? status,
    Login? login,
    Password? password,
  }) {
    return AuthorizationState(
      status: status ?? this.status,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, login, password];
}
