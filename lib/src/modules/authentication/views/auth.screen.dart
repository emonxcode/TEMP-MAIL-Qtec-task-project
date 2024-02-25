import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth.bloc.dart';
import '../bloc/auth.state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc')),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, homeState) => Center(
            child: Text(
          'C1:  ${homeState.counter1}  C2:  ${homeState.counter2}',
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        )),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<AuthenticationBloc>().increment(1),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<AuthenticationBloc>().decrement(1),
          ),
        ],
      ),
    );
  }
}
