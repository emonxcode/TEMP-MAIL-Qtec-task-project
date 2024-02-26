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
  AuthenticationScreen({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      body: Form(
        key: formKey,
        child: ScreenWrapperWidget(
            title: appName,
            subtitle: login,
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
                            controller: TextEditingController(),
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
                        const Flexible(
                          child: QtecTextWidget(
                            text: "@sampjledomailn.org",
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
                      obscureText: false,
                      controller: TextEditingController(),
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.visibility,
                            color: ColorManager.primaryColor,
                          )),
                    ),
                    AppSpace.spaceH30,
                    QtecButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      buttonText: login,
                      isLoading: false,
                      showIcon: false,
                      buttonColor: ColorManager.primaryColor,
                      textColor: ColorManager.whiteColor,
                    ),
                    AppSpace.spaceH20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const QtecTextWidget(text: dont_have_account),
                        TextButton(
                          onPressed: () {},
                          child: const QtecTextWidget(
                            text: create,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
