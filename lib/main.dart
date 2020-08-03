import 'package:basketball_score/scores/scores_bloc.dart';
import 'package:basketball_score/scores/scores_event.dart';
import 'package:basketball_score/scores/scores_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ScoreBoardPage(),
    );
  }
}

class ScoreBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScoresBloc>(
      create: (context) => ScoresBloc(),
      child: BlocBuilder<ScoresBloc, ScoresState>(
        builder: (context, state) {
          final scoresBloc = context.bloc<ScoresBloc>();
          return Scaffold(
            appBar: AppBar(
              title: Text('Basketball Scores'),
              actions: [
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    // add reset event
                    scoresBloc.add(ResetScore());
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Team A',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 48.0),
                        Text(
                          state.teamA.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 48.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamA, points: 1));
                          },
                          child: Text('+1 POINTS'),
                        ),
                        const SizedBox(height: 24.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamA, points: 2));
                          },
                          child: Text('+2 POINTS'),
                        ),
                        const SizedBox(height: 24.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamA, points: 3));
                          },
                          child: Text('+3 POINTS'),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Team B',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 48.0),
                        Text(
                          state.teamB.toString(),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(height: 48.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamB, points: 1));
                          },
                          child: Text('+1 POINTS'),
                        ),
                        const SizedBox(height: 24.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamB, points: 2));
                          },
                          child: Text('+2 POINTS'),
                        ),
                        const SizedBox(height: 24.0),
                        RaisedButton(
                          onPressed: () {
                            scoresBloc.add(
                                IncrementScore(team: Team.teamB, points: 3));
                          },
                          child: Text('+3 POINTS'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
