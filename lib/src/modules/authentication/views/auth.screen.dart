import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/modules/common/qtec_button.dart';
import 'package:temp_mail/src/modules/common/qtec_text_field.dart';
import 'package:temp_mail/src/utils/context.dart';

import '../../../config/app_space.dart';
import '../../../config/colors.dart';
import '../../../config/constants.dart';
import '../../common/qtec_text_widget.dart';
import '../../common/screen_wrapper.dart';
import '../bloc/auth.bloc.dart';
import '../bloc/auth.state.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key, required this.domain});
  final String domain;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      body: Form(
          key: formKey,
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return ScreenWrapperWidget(
                title: appName,
                subtitle: state.pageStatus == 0 ? login : create_email_account,
                showBackBtn: true,
                child: Column(
                  children: [
                    Flexible(
                        child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: QtecTextField(
                                textInputType: TextInputType.text,
                                fillColor: ColorManager.whiteColor,
                                color: ColorManager.whiteColor,
                                hint: enter_email,
                                obscureText: false,
                                controller: state.emailTextController,
                                maxLines: 1,
                                onFieldSubmitted: (string) {
                                  return null;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return cannot_be_empty;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            AppSpace.spaceW10,
                            Flexible(
                              child: QtecTextWidget(
                                text: "@$domain",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        AppSpace.spaceH16,
                        QtecTextField(
                          textInputType: TextInputType.text,
                          fillColor: ColorManager.whiteColor,
                          color: ColorManager.whiteColor,
                          hint: enter_password,
                          obscureText: !state.showPassword!,
                          controller: state.passwordTextController,
                          maxLines: 1,
                          onFieldSubmitted: (string) {
                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return cannot_be_empty;
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<AuthenticationBloc>()
                                    .showPassword();
                              },
                              icon: Icon(
                                state.showPassword!
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorManager.primaryColor,
                              )),
                        ),
                        AppSpace.spaceH30,
                        QtecButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (state.pageStatus == 0) {
                                context.read<AuthenticationBloc>().login();
                              } else {
                                context
                                    .read<AuthenticationBloc>()
                                    .createAccount();
                              }
                            }
                          },
                          buttonText: state.pageStatus == 0 ? login : create,
                          isLoading: false,
                          showIcon: false,
                          buttonColor: ColorManager.primaryColor,
                          textColor: ColorManager.whiteColor,
                        ),
                        AppSpace.spaceH20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QtecTextWidget(
                                text: state.pageStatus == 0
                                    ? dont_have_account
                                    : already_have_account),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AuthenticationBloc>()
                                    .changePageStatus(
                                        state.pageStatus == 0 ? 1 : 0);
                              },
                              child: QtecTextWidget(
                                text: state.pageStatus == 0 ? create : login,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              );
            },
          )),
    );
  }
}
