import 'package:meta/meta.dart';

enum Team {
  teamA,
  teamB,
}

abstract class ScoresEvent {
  const ScoresEvent();
}

class IncrementScore extends ScoresEvent {
  const IncrementScore({
    @required this.team,
    @required this.points,
  })  : assert(team != null),
        assert(points != null);

  final Team team;
  final int points;
}

class ResetScore extends ScoresEvent {
  const ResetScore();
}
