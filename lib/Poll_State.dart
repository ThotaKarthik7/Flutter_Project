class PollState {
  final Map<String, int> votes;

  PollState(this.votes);

  PollState.initial()
      : votes = {
    'Flutter': 0,
    'Java': 0,
    'Vue.js': 0,
    'Angular': 0,
    'Swift': 0,
  };

  PollState copyWith({Map<String, int>? newVotes}) {
    return PollState(newVotes ?? votes);
  }
}
