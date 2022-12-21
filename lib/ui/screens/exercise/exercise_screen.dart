import 'dart:async';

import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/data/models/exercise.dart';
import 'package:eye_do/data/repositories/mock_exercise_repository.dart';
import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final getItService = GetItService();
  late NavigatorService navigatorService;
  late EyeDoDataBase dataBase;
  final mockExerciseRepository = MockExerciseRepository();
  late List<Exercise> exercises;
  late int page = 0;
  late Timer _timer;
  late int _countdownTime;
  late bool relax = false;
  late bool pause = false;

  @override
  void initState() {
    super.initState();
    dataBase = getItService.eyeDoDataBase;
    navigatorService = getItService.navigatorService;
    exercises = mockExerciseRepository.getListException();
    _countdownTime = exercises[page].timer;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_countdownTime < 1) {
        if (!relax) {
          page++;
          dataBase.addTime();
        }
        if (page == exercises.length) {
          navigatorService.onNotification();
          _timer.cancel();
        } else {
          relax = !relax;
          if (relax) {
            _countdownTime = 5;
          } else {
            _countdownTime = exercises[page].timer;
          }
          setState(() {});
        }
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: navigatorService.onPop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              relax ? 'Отдых' : exercises[page].title,
              style: TextStyle(color: AppColor.whiteColor.withOpacity(pause ? 0.3 : 1)),
            ),
            const SizedBox(height: 50),
            Text(
              pause ? 'Пауза' : _countdownTime.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Theme.of(context).secondaryHeaderColor),
            ),
            if (!relax)
              Opacity(
                opacity: pause ? 0.3 : 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 70),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(exercises[page].image),
                ),
              )
            else
              const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                relax
                    ? 'Отдыхайте и подготовтесь к следующей задаче'
                    : 'На секунду задерживайте взгляд в центральной, верхней и нижней точках.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColor.whiteColor.withOpacity(pause ? 0.3 : 1)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() => pause = !pause);
                    if (pause) {
                      _timer.cancel();
                    } else {
                      startTimer();
                    }
                  },
                  icon: Icon(
                    Icons.pause_circle_filled,
                    size: 40,
                    color: AppColor.whiteColor.withOpacity(pause ? 1 : 0.3),
                  ),
                ),
                if (!relax)
                  IconButton(
                    onPressed: () {
                      page++;
                      if (page == exercises.length) {
                        navigatorService.onNotification();
                        _timer.cancel();
                      } else {
                        relax = true;
                        _countdownTime = 5;
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: AppColor.whiteColor.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: relax ? null : _Status(title: '${page + 1}/${exercises.length}'),
    );
  }
}

class _Status extends StatelessWidget {
  final String title;

  const _Status({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.only(bottom: 70),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }
}
