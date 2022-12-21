import 'dart:async';

import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/navigator_service.dart';
import 'package:eye_do/ui/common/progress_bar.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class EyeScreen extends StatefulWidget {
  final Function()? onSetting;
  final Function()? onSchedule;

  const EyeScreen({
    Key? key,
    this.onSetting,
    this.onSchedule,
  }) : super(key: key);

  @override
  State<EyeScreen> createState() => _EyeScreenState();
}

class _EyeScreenState extends State<EyeScreen> {
  final getItService = GetItService();
  late NavigatorService navigatorService;
  late double x = 0;
  late double y = 0;
  late StreamSubscription<AccelerometerEvent> stream;

  @override
  void initState() {
    super.initState();
    navigatorService = getItService.navigatorService;
    stream = accelerometerEvents.listen((AccelerometerEvent event) {
      y = event.y;
      x = event.x;
      setState(() {});
    });
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  void recommendation() {
    showDialog(
      context: context,
      builder: (_) => const _Recommendation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: widget.onSetting != null
              ? IconButton(
                  onPressed: widget.onSetting,
                  icon: const Icon(Icons.settings),
                  color: AppColor.whiteColor,
                )
              : null,
          actions: [
            if (widget.onSchedule != null)
              IconButton(
                onPressed: widget.onSchedule,
                icon: const Icon(Icons.show_chart),
                color: AppColor.whiteColor,
              ),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgressBar(),
              const SizedBox(height: 80),
              Stack(
                children: [
                  //SvgPicture.asset(AppEyes.green),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: AppColor.whiteColor,
                    ),
                  ),
                  Positioned(
                    top: (y * 10) + 90 > 90
                        ? 90
                        : (y * 10) + 90 < 0
                            ? 0
                            : (y * 10) + 90,
                    right: (x * 10) + 50 < 9
                        ? 9
                        : (x * 10) + 50 > 90
                            ? 90
                            : (x * 10) + 50,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (y * 15) + 140 > 135 ? 135 : (y * 15) + 140,
                    right: (x * 10) + 80 > 110 ? 110 : (x * 10) + 80,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: AppColor.backgroundColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: navigatorService.onStart,
                child: const Text(
                  'Начать',
                  style: TextStyle(color: AppColor.backgroundColor),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              GestureDetector(
                onTap: recommendation,
                child: const Text(
                  'Рекомендация',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Recommendation extends StatelessWidget {
  const _Recommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Зарядка для глаз во время работы перед монитором важна не менее, чем разминки спины после дня в полусогнутом положении. 2-3 минуты помогают вернутьтонус глазным мышцам.\n\nВ комплексе набор упражнений,во время которых нужносмотреть в направления,указываемые точкой.\n\nХорошего зрения!',
            style: TextStyle(color: Theme.of(context).backgroundColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
