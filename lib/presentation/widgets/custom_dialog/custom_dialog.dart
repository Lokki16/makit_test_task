import 'package:makit_test_task/presentation/template/template.dart';

class CustomDialog extends StatelessWidget {
  final double borderRadius;
  final double verticalPadding;
  final double horizontalPadding;
  final List<Widget> children;

  const CustomDialog({
    super.key,
    this.borderRadius = 16,
    this.verticalPadding = 60,
    this.horizontalPadding = 48,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r)),
      child: Container(
        width: 327.w,
        height: 348.h,
        padding: EdgeInsets.only(
          left: horizontalPadding.w,
          right: horizontalPadding.w,
          top: verticalPadding.h,
          bottom: verticalPadding.h,
        ),
        child: Column(children: children),
      ),
    );
  }
}
