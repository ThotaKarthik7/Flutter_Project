import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Poll_Bloc.dart';
import 'Poll_Event.dart';
import 'Poll_State.dart';

class PollPage extends StatelessWidget {
  const PollPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PollBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(">>>>>>>>>>>Favorite Framework Poll<<<<<<<<<<<<"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              bloc.add(ResetPoll());
            },
          )
        ],
      ),
      body: BlocBuilder<PollBloc, PollState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: state.votes.entries.map((entry) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(entry.key),
                  trailing: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: Text(
                      '${entry.value}',
                      key: ValueKey(entry.value),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () => bloc.add(VoteOption(entry.key)),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
