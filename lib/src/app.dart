import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/authentication/bloc/auth.bloc.dart';
import 'modules/authentication/views/auth.screen.dart';
import 'modules/domain_listing/views/domains.screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TEMP MAIL',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) => AuthenticationBloc(),
            ),
          ],
          child: const DomainsScreen(),
        ));
  }
}
