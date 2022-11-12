import 'dart:async';

enum AuthorizationStatus { unknown, authenticated, unauthenticated }

class AuthorizationRepository {
  final _controller = StreamController<AuthorizationStatus>();

  Stream<AuthorizationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthorizationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String login,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthorizationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthorizationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
