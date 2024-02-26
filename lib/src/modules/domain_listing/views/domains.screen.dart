import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/config/app_space.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/qtec_text_widget.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../../common/screen_wrapper.dart';
import '../bloc/domains.bloc.dart';
import '../bloc/domains.state.dart';
import 'components/domain_items.dart';

class DomainsScreen extends StatefulWidget {
  const DomainsScreen({super.key});

  @override
  State<DomainsScreen> createState() => _DomainsScreenState();
}

class _DomainsScreenState extends State<DomainsScreen> {
  @override
  void initState() {
    super.initState();

    Future(() =>
        context.read<DomainsBloc>().getAvailableDomains(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      body: ScreenWrapperWidget(
        title: appName,
        subtitle: available_domain,
        showBackBtn: false,
        showActionBtn: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpace.spaceH10,
            const QtecTextWidget(
              text: tap_to_create,
              color: ColorManager.primaryColor,
            ),
            AppSpace.spaceH20,
            BlocBuilder<DomainsBloc, DomainsState>(
              builder: (context, state) {
                return Flexible(
                  child: state.isLoading!
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.available_domains!.isNotEmpty
                          ? ListView.separated(
                              itemCount: state.available_domains!.length,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  AppSpace.spaceH10,
                              itemBuilder: (context, index) => DomainItemWidget(
                                  domain: state.available_domains![index]),
                            )
                          : const Center(
                              child: QtecTextWidget(text: "No domains found!"),
                            ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
