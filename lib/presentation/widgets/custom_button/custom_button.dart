import 'package:makit_test_task/presentation/template/template.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 38.h,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? ThemeColors.purple : ThemeColors.purple2,
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
