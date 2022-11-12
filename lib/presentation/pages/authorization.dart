import 'package:makit_test_task/presentation/template/template.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: HeaderClipper(),
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
          CustomDialog(
            children: [
              const CustomInputField(labelText: ConstantText.email),
              SizedBox(height: 32.h),
              const CustomInputField(labelText: ConstantText.password),
              SizedBox(height: 56.h),
              CustomButton(
                text: ConstantText.comeIn,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.routeToUsers),
                isActive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
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
  bool shouldReclip(HeaderClipper oldClipper) => false;
}
