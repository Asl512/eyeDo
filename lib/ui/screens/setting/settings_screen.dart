import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function()? onBack;

  const SettingsScreen({
    Key? key,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            if (onBack != null)
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Wrap(
                runSpacing: 20,
                children: const [
                  _Sound(active: true),
                  _Vibration(active: false),
                  _Notification(active: true),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.33),
              GestureDetector(
                child: const Text('Оценить'),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: const Text('Связаться с разрабочиком'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Sound extends StatefulWidget {
  final bool active;

  const _Sound({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<_Sound> createState() => _SoundState();
}

class _SoundState extends State<_Sound> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.active;
  }

  void onChanged(bool value) {
    setState(() => active = !active);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Звук'),
        CupertinoSwitch(
          activeColor: AppColor.whiteColor,
          trackColor: AppColor.labelTertiary,
          thumbColor: Theme.of(context).primaryColor,
          value: active,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _Vibration extends StatefulWidget {
  final bool active;

  const _Vibration({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<_Vibration> createState() => _VibrationState();
}

class _VibrationState extends State<_Vibration> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.active;
  }

  void onChanged(bool value) {
    setState(() => active = !active);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Вибрация'),
        CupertinoSwitch(
          activeColor: AppColor.whiteColor,
          trackColor: AppColor.labelTertiary,
          thumbColor: Theme.of(context).primaryColor,
          value: active,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _Notification extends StatefulWidget {
  final bool active;

  const _Notification({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  State<_Notification> createState() => _NotificationState();
}

class _NotificationState extends State<_Notification> {
  late bool active;

  @override
  void initState() {
    super.initState();
    active = widget.active;
  }

  void onChanged(bool value) {
    setState(() => active = !active);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Напоминания'),
        CupertinoSwitch(
          activeColor: AppColor.whiteColor,
          trackColor: AppColor.labelTertiary,
          thumbColor: Theme.of(context).primaryColor,
          value: active,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
