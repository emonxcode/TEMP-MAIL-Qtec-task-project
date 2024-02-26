import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/config/app_space.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/qtec_text_widget.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../bloc/auth.bloc.dart';
import '../bloc/auth.state.dart';
import 'components/domain_items.dart';

class DomainsScreen extends StatefulWidget {
  const DomainsScreen({super.key});

  @override
  State<DomainsScreen> createState() => _DomainsScreenState();
}

class _DomainsScreenState extends State<DomainsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      appBar: AppBar(
        title: const QtecTextWidget(
          text: appName,
          color: ColorManager.whiteColor,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        elevation: 0,
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            const Divider(
              height: 0.2,
              color: ColorManager.whiteColor,
            ),
            Container(
              height: context.height * 0.08,
              width: context.width,
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  color: ColorManager.primaryColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(25))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  QtecTextWidget(
                    text: available_domain,
                    color: ColorManager.whiteColor,
                  ),
                  AppSpace.spaceW10,
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.zero,
              height: context.height * 0.9 -
                  (MediaQuery.of(context).viewPadding.top +
                      MediaQuery.of(context).viewPadding.bottom +
                      60),
              width: context.width,
              decoration: const BoxDecoration(
                color: ColorManager.primaryColor,
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: ColorManager.scaffoldBackGroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpace.spaceH10,
                    const QtecTextWidget(
                      text: tap_to_create,
                      color: ColorManager.primaryColor,
                    ),
                    AppSpace.spaceH20,
                    Flexible(
                      child: ListView.separated(
                        itemCount: 2,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => AppSpace.spaceH10,
                        itemBuilder: (context, index) =>
                            const DomainItemWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
