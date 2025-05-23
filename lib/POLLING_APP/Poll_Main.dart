import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Poll_Bloc.dart';
import 'Poll_Page.dart';

void main() {
  runApp(const PollApp());
}

class PollApp extends StatelessWidget {
  const PollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PollBloc(),
      child: MaterialApp(
        title: 'Voting App',
        debugShowCheckedModeBanner: false,
        home: const PollPage(),
      ),
    );
  }
}
