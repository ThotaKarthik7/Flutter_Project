import 'dart:async';

class VotingBloc {
  final _voteController = StreamController<Map<String, int>>.broadcast();
  Map<String, int> _votes = {"Flutter": 0, "React Native": 0};
  Stream<Map<String, int>> get votesStream => _voteController.stream;

  void vote(String tech) {
    _votes[tech] = (_votes[tech] ?? 0) + 1;
    _voteController.sink.add(_votes);
  }
  void reset() {
    _votes = {"Flutter": 0, "React Native": 0};
    _voteController.sink.add(_votes);
  }
  void dispose() {
    _voteController.close();
  }
}