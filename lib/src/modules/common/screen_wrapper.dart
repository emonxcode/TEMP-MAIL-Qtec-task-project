import 'package:flutter/material.dart';
import 'package:temp_mail/src/utils/context.dart';

import '../../config/app_space.dart';
import '../../config/colors.dart';
import 'qtec_text_widget.dart';

class ScreenWrapperWidget extends StatelessWidget {
  const ScreenWrapperWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.showBackBtn,
    required this.showActionBtn,
    this.onActionPressed,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final bool showBackBtn;
  final bool showActionBtn;
  final GestureTapCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 65,
                width: context.width,
                color: ColorManager.primaryColor,
                child: SafeArea(
                  child: Row(
                    children: [
                      if (!showBackBtn) AppSpace.spaceW30,
                      if (showBackBtn)
                        IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      const Spacer(),
                      QtecTextWidget(
                        text: title,
                        color: ColorManager.whiteColor,
                      ),
                      const Spacer(),
                      if (!showActionBtn) AppSpace.spaceW30,
                      if (showActionBtn)
                        IconButton(
                          onPressed: onActionPressed,
                          icon: const Icon(
                            Icons.logout,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: context.width,
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    QtecTextWidget(
                      text: subtitle,
                      color: ColorManager.whiteColor,
                    ),
                    AppSpace.spaceW20,
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.zero,
                height: context.height - (150),
                width: context.width,
                decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: ColorManager.scaffoldBackGroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
