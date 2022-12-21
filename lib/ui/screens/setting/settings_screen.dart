import 'package:eye_do/data/models/app_theme.dart';
import 'package:eye_do/domain/services/theme_service.dart';
import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  final Function()? onBack;

  const SettingsScreen({
    Key? key,
    this.onBack,
  }) : super(key: key);

  void contactDeveloper() async {
    final url = Uri.parse('https://vk.com/astraslan');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

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
                  _ChoiceEye(),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.33),
              GestureDetector(
                child: const Text('Оценить'),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: contactDeveloper,
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
          thumbColor: Theme.of(context).secondaryHeaderColor,
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
          thumbColor: Theme.of(context).secondaryHeaderColor,
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
        const Text('Уведомления'),
        CupertinoSwitch(
          activeColor: AppColor.whiteColor,
          trackColor: AppColor.labelTertiary,
          thumbColor: Theme.of(context).secondaryHeaderColor,
          value: active,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _ChoiceEye extends StatelessWidget {
  const _ChoiceEye({Key? key}) : super(key: key);

  void openModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const _SelectEye(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Выберите цвет глаз'),
        GestureDetector(
          onTap: () => openModalBottomSheet(context),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(500),
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectEye extends StatefulWidget {
  const _SelectEye({Key? key}) : super(key: key);

  @override
  State<_SelectEye> createState() => _SelectEyeState();
}

class _SelectEyeState extends State<_SelectEye> {
  late ThemeService themeService;

  @override
  void initState() {
    super.initState();
    themeService = Provider.of<ThemeService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Wrap(
        children: [
          for (var eye in appThemes)
            GestureDetector(
              onTap: () {
                themeService.setTheme(appTheme: eye);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Theme.of(context).backgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (eye.name == ThemeName.brown) const Text('Карий'),
                    if (eye.name == ThemeName.green) const Text('Зеленый'),
                    if (eye.name == ThemeName.blue) const Text('Голубой'),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: eye.mainColor,
                        borderRadius: BorderRadius.circular(500),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
