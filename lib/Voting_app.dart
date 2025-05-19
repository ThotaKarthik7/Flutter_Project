import 'package:flutter/material.dart';
import 'Voting_Bloc.dart';


void main() {
  runApp(VotingApp());
}

class VotingApp extends StatefulWidget {
  @override
  _VotingAppState createState() => _VotingAppState();
}

class _VotingAppState extends State<VotingApp> {
  final VotingBloc _bloc = VotingBloc();
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Voting App with BLoC")),
        body: Column(
          children: [
            StreamBuilder<Map<String, int>>(
              stream: _bloc.votesStream,
              initialData: {"Flutter": 0, "React Native": 0},
              builder: (context, snapshot) {
                final votes = snapshot.data!;
                return Column(
                  children: votes.entries.map((entry) {
                    return ListTile(
                      title: Text(entry.key),
                      trailing: Text("${entry.value} votes"),
                    );
                  }).toList(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                    onPressed: () => _bloc.vote("Flutter"),
                    child: Text("Vote Flutter")),
                ElevatedButton(
                    onPressed: () => _bloc.vote("React Native"),
                    child: Text("Vote React Native")),
              ],
            ),
            ElevatedButton(
                onPressed: _bloc.reset, child: Text("Reset Votes")),
          ],
        ),
      ),
    );
  }
}