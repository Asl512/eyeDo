import 'package:eye_do/ui/res/colors.dart';
import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  final int active;

  const StatusBar({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.52,
      margin: const EdgeInsets.only(bottom: 70),
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: AppColor.labelTertiary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Wrap(
          spacing: 3,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: i == active ? Theme.of(context).primaryColor : const Color(0XFF5A5A5A),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
