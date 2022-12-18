import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/domain/services/shared_preferences_service.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late int count = 0;
  final getItService = GetItService();
  late SharedPreferencesService sharedPreferencesService;

  @override
  void initState() {
    super.initState();
    sharedPreferencesService = getItService.sharedPreferencesService;
    getCount();
  }

  void getCount() async {
    count = await sharedPreferencesService.getCount();
    if (count > 30) count = 30;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Прогресс $count / 30'),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.63 * (count / 30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(40),
                ),
                color: AppColor.primaryColor,
              ),
            ),
            Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 3,
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
