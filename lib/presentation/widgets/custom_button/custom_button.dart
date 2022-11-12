import 'package:makit_test_task/presentation/template/template.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColors.purple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
        child: CustomText(
          text: text,
          style: ThemeTextStyle.s16,
        ),
      ),
    );
  }
}
