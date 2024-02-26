import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:temp_mail/src/config/app_space.dart';
import 'package:temp_mail/src/config/constants.dart';
import 'package:temp_mail/src/modules/common/qtec_text_widget.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/messages.bloc.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/messages.state.dart';
import 'package:temp_mail/src/utils/context.dart';
import '../../../config/colors.dart';
import '../../common/screen_wrapper.dart';
import 'components/confirmation.dialog.dart';

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
      context.read<MessagesBloc>().getEmail();
      context.read<MessagesBloc>().getMessages(context: context);
    });
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.scaffoldBackGroundColor,
        body: BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, state) {
            return ScreenWrapperWidget(
              title: appName,
              subtitle: state.email ?? "",
              showBackBtn: false,
              showActionBtn: true,
              onActionPressed: () {
                showConfirmationDialog(context);
              },
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                header: const WaterDropHeader(),
                controller: _refreshController,
                onRefresh: () async {
                  await context
                      .read<MessagesBloc>()
                      .getMessages(context: context);
                  _refreshController.refreshCompleted();
                },

                onLoading: () async {
                  await context
                      .read<MessagesBloc>()
                      .getMessages(context: context );
                  _refreshController.loadComplete();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpace.spaceH10,
                    const QtecTextWidget(
                      text: messages,
                      color: ColorManager.primaryColor,
                    ),
                    AppSpace.spaceH20,
                    Flexible(
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
                                  itemBuilder: (context, index) => Container(
                                    width: context.width,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: CircleAvatar(
                                            child: QtecTextWidget(
                                                text: state.messages![index]
                                                    .from!.name![0]
                                                    .toString()),
                                          ),
                                        ),
                                        AppSpace.spaceW10,
                                        Flexible(
                                          flex: 5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  QtecTextWidget(
                                                    text: state.messages![index]
                                                            .from!.name ??
                                                        "",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                  QtecTextWidget(
                                                    text: DateFormat(
                                                            'dd MMM yy hh:mm a')
                                                        .format(state
                                                            .messages![index]
                                                            .createdAt!),
                                                    fontSize: 12,
                                                    color: ColorManager.grey,
                                                  ),
                                                ],
                                              ),
                                              QtecTextWidget(
                                                text:
                                                    "From: ${state.messages![index].from!.address}" ??
                                                        "",
                                                fontSize: 13,
                                              ),
                                              const Divider(),
                                              QtecTextWidget(
                                                text: state.messages![index]
                                                        .subject ??
                                                    "",
                                                fontSize: 15,
                                              ),
                                              QtecTextWidget(
                                                text: state.messages![index]
                                                        .intro ??
                                                    "",
                                                fontSize: 13,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: QtecTextWidget(
                                      text: "No messages found!"),
                                ),
                    ),
                  ],
                ), // scroll view
              ),
            );
          },
        ));
  }
}
