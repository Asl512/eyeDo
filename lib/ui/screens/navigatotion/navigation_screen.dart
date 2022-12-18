import 'package:eye_do/ui/common/status_bar.dart';
import 'package:eye_do/ui/screens/eye/eye_screen.dart';
import 'package:eye_do/ui/screens/schedule/schedule_screen.dart';
import 'package:eye_do/ui/screens/setting/settings_screen.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late PageController _pageController;
  late int currentIndex = 1;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
    _pageController.addListener(() {
      if (_pageController.page!.toInt() != currentIndex) {
        setState(() => currentIndex = _pageController.page!.toInt());
      }
    });
    _screens = [
      SettingsScreen(onBack: () => toPage(indexPage: 1)),
      EyeScreen(
        onSetting: () => toPage(indexPage: 0),
        onSchedule: () => toPage(indexPage: 2),
      ),
      ScheduleScreen(onBack: () => toPage(indexPage: 1)),
    ];
  }

  void toPage({required int indexPage}) {
    _pageController.animateToPage(
      indexPage,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
      ),
      floatingActionButton: StatusBar(active: currentIndex),
    );
  }
}
