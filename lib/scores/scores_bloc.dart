import 'package:bloc/bloc.dart';
import 'scores_event.dart';
import 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  ScoresBloc() : super(const ScoresState());

  @override
  Stream<ScoresState> mapEventToState(ScoresEvent event) async* {
    if (event is IncrementScore) {
      if (event.team == Team.teamA) {
        int scoreA = state.teamA;
        scoreA += event.points;
        yield state.copyWith(
          teamA: scoreA,
        );
      } else {
        // teamB
        int scoreB = state.teamB;
        scoreB += event.points;
        yield state.copyWith(
          teamB: scoreB,
        );
      }
    } else if (event is ResetScore) {
      yield ScoresState();
    }
  }
}
