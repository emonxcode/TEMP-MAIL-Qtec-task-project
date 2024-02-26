import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/config/app_space.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/qtec_text_widget.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../../common/screen_wrapper.dart';
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
      body: ScreenWrapperWidget(
          title: appName,
          subtitle: available_domain,
          showBackBtn: false,
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
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => AppSpace.spaceH10,
                  itemBuilder: (context, index) => const DomainItemWidget(),
                ),
              ),
            ],
          )),
    );
  }
}
