import 'dart:async';

import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:flutter/material.dart';

class StartExerciseScreen extends StatefulWidget {
  const StartExerciseScreen({Key? key}) : super(key: key);

  @override
  State<StartExerciseScreen> createState() => _StartExerciseScreenState();
}

class _StartExerciseScreenState extends State<StartExerciseScreen> {
  late Timer _timer;
  late int _countdownTime = 3;
  final getItService = GetItService();
  late NavigatorService navigatorService;

  @override
  void initState() {
    super.initState();
    navigatorService = getItService.navigatorService;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countdownTime < 1) {
        navigatorService.onExercise();
        _timer.cancel();
      } else {
        _countdownTime = _countdownTime - 1;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _countdownTime == 0 ? 'Начали' : (_countdownTime).toString(),
          style: const TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}
