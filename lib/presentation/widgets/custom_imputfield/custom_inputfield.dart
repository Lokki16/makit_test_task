import 'package:makit_test_task/presentation/template/template.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final void Function(String) onChanged;

  const CustomInputField({
    super.key,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 51.h,
      child: TextFormField(
        onChanged: onChanged,
        style: ThemeTextStyle.s16.copyWith(color: ThemeColors.black),
        decoration: InputDecoration(
          labelText: labelText.tr,
          labelStyle: ThemeTextStyle.s16.copyWith(color: ThemeColors.grey2),
          floatingLabelStyle:
              ThemeTextStyle.s14.copyWith(color: ThemeColors.purple),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.black3)),
        ),
        cursorColor: ThemeColors.purple,
      ),
    );
  }
}
