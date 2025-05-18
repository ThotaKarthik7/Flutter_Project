class PollState {
  final Map<String, int> votes;

  PollState(this.votes);

  PollState.initial()
      : votes = {
    'Flutter': 0,
    'React': 0,
    'Vue': 0,
    'Angular': 0,
  };

  PollState copyWith({Map<String, int>? newVotes}) {
    return PollState(newVotes ?? votes);
  }
}
