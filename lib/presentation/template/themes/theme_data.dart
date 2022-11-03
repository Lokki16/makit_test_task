import 'package:makit_test_task/presentation/template/template.dart';

class MakItAppTheme {
  static ThemeData get lightAndroidTheme => ThemeData(
        platform: TargetPlatform.android,
        brightness: Brightness.light,
        scaffoldBackgroundColor: ThemeColors.white,
      );
}
