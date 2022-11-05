import 'package:makit_test_task/presentation/template/template.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;

  const CustomInputField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: ThemeTextStyle.s16.copyWith(color: ThemeColors.grey2),
          floatingLabelStyle:
              ThemeTextStyle.s14.copyWith(color: ThemeColors.purple),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.black3)),
        ),
        // cursorColor: ThemeColors.purple,
      ),
    );
  }
}
