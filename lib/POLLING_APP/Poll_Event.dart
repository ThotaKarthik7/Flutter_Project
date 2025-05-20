abstract class PollEvent {}

class VoteOption extends PollEvent {
  final String option;
  VoteOption(this.option);
}

class ResetPoll extends PollEvent {}
