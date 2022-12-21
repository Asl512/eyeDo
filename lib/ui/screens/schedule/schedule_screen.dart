import 'package:eye_do/data/database/database.dart';
import 'package:eye_do/domain/services/get_it_service.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: const [
            Graphic(),
            SizedBox(height: 15),
            _Average(),
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
  late List<Map<String, Object>> data = [];
  late int averageToday = 0;

  @override
  void initState() {
    super.initState();
    dataBase = getItService.eyeDoDataBase;
    loadData();
  }

  void loadData() async {
    final weekDay = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    final now = DateTime.now();
    final nowWeekday = now.weekday - 1;
    for (int i = 0; i < weekDay.length; i++) {
      final date = now.add(Duration(days: i - nowWeekday));
      final count = await dataBase.getTime(dateTime: date);
      if (i == nowWeekday) {
        averageToday = (count * 30 / 60).round();
      }
      data.add({'day': weekDay[i], 'count': count * 30 / 60});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: const Color(0XFF303030),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('В среднем за день'),
          Text(
            '$averageToday мин',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: AppColor.whiteColor,
                ),
          ),
          const SizedBox(height: 10),
          if (data.isNotEmpty)
            SizedBox(
              height: 250,
              child: Chart(
                data: data,
                variables: {
                  'day': Variable(
                    accessor: (Map map) => map['day'] as String,
                  ),
                  'count': Variable(
                    accessor: (Map map) => map['count'] as num,
                  ),
                },
                elements: [
                  IntervalElement(
                    color: ColorAttr(value: Theme.of(context).primaryColor),
                  )
                ],
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor),
              ),
            ),
        ],
      ),
    );
  }
}

class _Average extends StatefulWidget {
  const _Average({Key? key}) : super(key: key);

  @override
  State<_Average> createState() => _AverageState();
}

class _AverageState extends State<_Average> {
  final getItService = GetItService();
  late EyeDoDataBase dataBase;
  late int averageToday = 0;
  late int averageWeek = 0;

  @override
  void initState() {
    super.initState();
    dataBase = getItService.eyeDoDataBase;
    loadData();
  }

  void loadData() async {
    final count = await dataBase.getTime(dateTime: DateTime.now());
    averageToday = (count * 30 / 60).round();
    final list = await dataBase.getAllTime();
    for (var element in list.values) {
      averageWeek += element;
    }
    averageWeek = (averageWeek * 30 / 7 / 60).round();
    setState(() {});
  }

  final texts = [
    'Вы совсем не делаете разминку. Вам стоит начать уделять внимание вашим глазам.',
    'Вы слишком мало времени уделяете своим глазам. Вам стоит почаще делать глазную разминку.',
    'Вы начали делать успехи, продолжайте в том же духе!',
    'Вы на верном пути! Продолжайте добиваться результата.',
    'Здоровье ваших глаз на пути к успеху, сегодня вы молодец!',
    'Вы выполнили норму тренировок на сегодняшний день. Будем ждать вас завтра!',
    'Ваши глаза благодарны вам, продолжайте в том же духе!',
  ];

  String get advice {
    if (averageToday == 0) return texts.first;
    if (averageToday > 0 && averageToday <= 5) return texts[1];
    if (averageToday > 5 && averageToday <= 8) return texts[2];
    if (averageToday > 8 && averageToday <= 11) return texts[3];
    if (averageToday > 14 && averageToday <= 20) return texts[4];
    return texts[5];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('За день'),
            Text('$averageToday мин'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('За неделю'),
            Text('$averageWeek мин'),
          ],
        ),
        const SizedBox(height: 40),
        Column(
          children: [
            const Text('Совет:'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                advice,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
