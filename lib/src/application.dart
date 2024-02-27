import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail/src/modules/domain_listing/bloc/domains.bloc.dart';
import 'package:temp_mail/src/modules/inbox_messages/bloc/messages.bloc.dart';
import 'package:temp_mail/src/modules/splash/splash.screen.dart';
import 'modules/authentication/bloc/auth.bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<DomainsBloc>(
          create: (BuildContext context) => DomainsBloc(),
        ),
        BlocProvider<MessagesBloc>(
          create: (BuildContext context) => MessagesBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'TEMP MAIL',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
