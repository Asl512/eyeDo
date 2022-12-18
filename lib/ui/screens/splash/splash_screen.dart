// ignore_for_file: constant_identifier_names

import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:eye_do/ui/screens/navigatotion/navigation_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const TIMEOUT_SECONDS = 2;
  final getItService = GetItService();
  late SharedPreferencesService sharedPreferencesService;

  @override
  void initState() {
    super.initState();
    sharedPreferencesService = getItService.sharedPreferencesService;
    _navigateToNext();
  }

  void _navigateToNext() async {
    Future.delayed(const Duration(seconds: TIMEOUT_SECONDS), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return const NavigationScreen();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Eye Do',
          style: Theme.of(context).textTheme.headline1!.copyWith(
            color: AppColor.whiteColor,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
