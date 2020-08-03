import 'package:equatable/equatable.dart';

class ScoresState extends Equatable {
  const ScoresState({
    this.teamA = 0,
    this.teamB = 0,
  })  : assert(teamA != null),
        assert(teamB != null);

  final int teamA;
  final int teamB;

  ScoresState copyWith({
    int teamA,
    int teamB,
  }) =>
      ScoresState(
        teamA: teamA ?? this.teamA,
        teamB: teamB ?? this.teamB,
      );

  @override
  List<Object> get props => [teamA, teamB];
}
