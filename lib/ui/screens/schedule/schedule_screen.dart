import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  final Function()? onBack;

  const ScheduleScreen({
    Key? key,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: onBack == null
              ? null
              : IconButton(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
        ),
        body: Column(
          children: const [
            Graphic(),
          ],
        ),
      ),
    );
  }
}

class Graphic extends StatefulWidget {
  const Graphic({Key? key}) : super(key: key);

  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  final getItService = GetItService();
  late EyeDoDataBase dataBase;
  late List<String> dates = [];
  late List<int> count = [];

  @override
  void initState() {
    super.initState();
    dataBase = getItService.eyeDoDataBase;
    initValues();
  }

  void initValues() async {
    final map = await dataBase.getTime();
    dates = map.keys.toList();
    count = map.values.toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [],
    );
  }
}
