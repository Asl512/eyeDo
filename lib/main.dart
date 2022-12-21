import 'package:eye_do/domain/services/locator_service.dart';
import 'package:eye_do/domain/services/theme_service.dart';
import 'package:eye_do/router.dart';
import 'package:eye_do/ui/res/theme.dart';
import 'package:eye_do/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final locator = LocatorService();

  runApp(FApp(locator: locator));
}

class FApp extends StatelessWidget {
  final LocatorService locator;

  const FApp({
    super.key,
    required this.locator,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeService>(
      create: (context) => ThemeService(sharedPreferencesService: locator.sharedPreferencesService),
      builder: (context, child) {
        final themeService = Provider.of<ThemeService>(context);
        return MaterialApp(
          theme: themeData(theme: themeService.appTheme),
          navigatorKey: locator.navigatorKey,
          title: 'Eye Do!',
          home: const SplashScreen(),
          onGenerateRoute: AppRouter.onGenerateRouters,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
