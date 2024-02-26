import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/config/app_space.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/qtec_text_widget.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/domains.bloc.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/domains.state.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../../common/screen_wrapper.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();

    Future(() {
      context.read<MessagesBloc>().getMessages(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      body: ScreenWrapperWidget(
        title: appName,
        subtitle: messages,
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
            BlocBuilder<MessagesBloc, MessagesState>(
              builder: (context, state) {
                return Flexible(
                  child: state.isLoading!
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.messages!.isNotEmpty
                          ? ListView.separated(
                              itemCount: state.messages!.length,
                              padding: EdgeInsets.zero,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  AppSpace.spaceH10,
                              itemBuilder: (context, index) => const SizedBox(),
                            )
                          : const Center(
                              child: QtecTextWidget(text: "No messages found!"),
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
