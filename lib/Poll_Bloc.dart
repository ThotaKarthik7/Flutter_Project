import 'package:flutter_bloc/flutter_bloc.dart';
import 'Poll_Event.dart';
import 'Poll_State.dart';

class PollBloc extends Bloc<PollEvent, PollState> {
  PollBloc() : super(PollState.initial()) {
    on<VoteOption>((event, emit) {
      final updatedVotes = Map<String, int>.from(state.votes);
      updatedVotes[event.option] = (updatedVotes[event.option] ?? 0) + 1;
      emit(PollState(updatedVotes));
    });

    on<ResetPoll>((event, emit) {
      emit(PollState.initial());
    });
  }
}
