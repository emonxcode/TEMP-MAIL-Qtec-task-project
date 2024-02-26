import 'package:flutter/material.dart';
import 'package:temp_mail/src/config/colors.dart';
import 'package:temp_mail/src/local/shared_preference_helper.dart';
import 'package:temp_mail/src/modules/domain_listing/views/domains.screen.dart';
import 'package:temp_mail/src/modules/inbox_messages/views/messages.screen.dart';
import 'package:temp_mail/src/utils/context.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future checkStatus() async {
    var isLoggedIn = await LocalData.getLoginFlag();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (isLoggedIn) {
        context.pushAndRemoveUntil(const MessagesScreen());
      } else {
        context.pushAndRemoveUntil(const DomainsScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Center(
          child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/qtec.png')),
        ),
      ),
    );
  }
}
