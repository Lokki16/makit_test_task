import 'package:makit_test_task/presentation/template/template.dart';

class MakItApp extends StatelessWidget {
  const MakItApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: Constants.showModeBanner,
        title: Constants.appTitle,
        themeMode: ThemeMode.light,
        theme: MakItAppTheme.lightAndroidTheme,
        locale: Locales().ruLocale,
        translations: GetLocalization(),
        routes: AppRoutes.getRoutes,
        initialRoute: AppRoutes.routeToAuthorization,
      ),
    );
  }
}
