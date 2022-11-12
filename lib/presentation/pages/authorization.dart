import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makit_test_task/presentation/template/template.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: _HeaderClipper(),
              child: Container(
                height: 378.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/background.png'),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 83.h, left: 24.w, right: 24.w),
              child: const CustomText(
                text: ConstantText.entry,
                style: ThemeTextStyle.s34,
              ),
            ),
          ),
          const _Form(),
        ],
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(
        authenticationRepository:
            RepositoryProvider.of<AuthorizationRepository>(context),
      ),
      child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: CustomDialog(
          children: [
            const _LoginInput(),
            SizedBox(height: 32.h),
            const _PasswordInput(),
            SizedBox(height: 56.h),
            const _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _LoginInput extends StatelessWidget {
  const _LoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      buildWhen: (previous, current) => previous.login != current.login,
      builder: (context, state) {
        return CustomInputField(
          labelText: ConstantText.email,
          onChanged: (login) => context
              .read<AuthorizationBloc>()
              .add(AuthorizationLoginChanged(login)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomInputField(
          labelText: ConstantText.password,
          onChanged: (password) => context
              .read<AuthorizationBloc>()
              .add(AuthorizationPasswordChanged(password)),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : CustomButton(
                text: ConstantText.comeIn,
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .read<AuthorizationBloc>()
                            .add(const AuthorizationSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 350.h);
    path.lineTo(size.width, 250.h);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_HeaderClipper oldClipper) => false;
}
