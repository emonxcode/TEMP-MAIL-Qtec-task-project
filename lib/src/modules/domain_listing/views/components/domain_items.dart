import 'package:flutter/material.dart';

import '../../../../config/app_space.dart';
import '../../../../config/colors.dart';
import '../../../common/qtec_text_widget.dart';

class DomainItemWidget extends StatelessWidget {
  const DomainItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.whiteColor,
        ),
        child: const Row(
          children: [
            AppSpace.spaceW16,
            Icon(
              Icons.email,
              color: ColorManager.primaryColor,
            ),
            AppSpace.spaceW20,
            QtecTextWidget(
              text: "emargentvillage.org",
              color: ColorManager.blackColor,
              fontSize: 15,
            ),
          ],
        ),
      ),
    );
  }
}
