import 'package:flutter/material.dart';
import 'package:temp_mail/src/modules/authentication/views/auth.screen.dart';
import 'package:temp_mail/src/utils/context.dart';

import '../../../../config/app_space.dart';
import '../../../../config/colors.dart';
import '../../../common/qtec_text_widget.dart';
import '../../models/domain.mode.dart';

class DomainItemWidget extends StatelessWidget {
  const DomainItemWidget({
    super.key,
    required this.domain,
  });

  final Domain domain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AuthenticationScreen(
          domain: domain.domain,
        ));
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.whiteColor,
        ),
        child: Row(
          children: [
            AppSpace.spaceW16,
            const Icon(
              Icons.email,
              color: ColorManager.primaryColor,
            ),
            AppSpace.spaceW20,
            QtecTextWidget(
              text: domain.domain ?? "",
              color: ColorManager.blackColor,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}
