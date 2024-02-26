import 'package:flutter/material.dart';
import 'package:temp_mail/src/utils/context.dart';

import '../../../../config/colors.dart';
import '../../../../local/shared_preference_helper.dart';
import '../../../common/qtec_button.dart';
import '../../../common/qtec_text_widget.dart';
import '../../../splash/splash.screen.dart';

Future<dynamic> showConfirmationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const QtecTextWidget(text: "Are you sure want to logout?"),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          QtecButton(
            buttonHeight: 40,
            buttonWidth: 100,
            onTap: () {
              context.pop();
            },
            buttonText: "Cancel",
            isLoading: false,
            showIcon: false,
            textColor: ColorManager.whiteColor,
            buttonColor: ColorManager.primaryColor,
          ),
          QtecButton(
            buttonHeight: 40,
            buttonWidth: 100,
            textColor: ColorManager.whiteColor,
            buttonColor: ColorManager.redColor,
            onTap: () async {
              await LocalData.setLoginFlag(false);
              if (context.mounted) {
                context.pushAndRemoveUntil(const SplashScreen());
              }
            },
            buttonText: "Logout",
            isLoading: false,
            showIcon: false,
          ),
        ],
      );
    },
  );
}
