import 'package:eye_do/ui/res/colors.dart';
import 'package:eye_do/ui/res/text_style.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class ExceptionInteractor {
  ExceptionInteractor();

  void showError({required String message}) {
    showOverlayNotification(
      (BuildContext context) {
        return Material(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            color: AppColor.primaryColor,
            child: Text(
              message,
              style: textBody1.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      position: NotificationPosition.bottom,
    );
  }
}
