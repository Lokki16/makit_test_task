import 'package:makit_test_task/presentation/template/template.dart';

import 'package:bloc/bloc.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({required AuthorizationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthorizationState()) {
    on<AuthorizationLoginChanged>(_onLoginChanged);
    on<AuthorizationPasswordChanged>(_onPasswordChanged);
    on<AuthorizationSubmitted>(_onSubmitted);
  }

  final AuthorizationRepository _authenticationRepository;

  void _onLoginChanged(
    AuthorizationLoginChanged event,
    Emitter<AuthorizationState> emit,
  ) {
    final login = Login.dirty(event.login);
    emit(
      state.copyWith(
        login: login,
        status: Formz.validate([state.password, login]),
      ),
    );
  }

  void _onPasswordChanged(
    AuthorizationPasswordChanged event,
    Emitter<AuthorizationState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.login]),
      ),
    );
  }

  Future<void> _onSubmitted(
    AuthorizationSubmitted event,
    Emitter<AuthorizationState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authenticationRepository.logIn(
          login: state.login.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
