import 'package:eye_do/domain/redux/store.dart';
import 'package:eye_do/domain/services/locator_service.dart';
import 'package:eye_do/router.dart';
import 'package:eye_do/ui/res/theme.dart';
import 'package:eye_do/ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:overlay_support/overlay_support.dart';

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
    return StoreProvider<AppState>(
      store: locator.store,
      child: OverlaySupport.global(
        child: MaterialApp(
          theme: themeData,
          navigatorKey: locator.navigatorKey,
          title: 'Eye Do!',
          home: const SplashScreen(),
          onGenerateRoute: AppRouter.onGenerateRouters,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
