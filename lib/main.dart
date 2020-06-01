import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/sequence/SequencerBloc.dart';
import 'package:fluttermidisequencer/widget/sequencer/PadsSequencer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => SequencerPlayerBloc(),
          child: BlocBuilder<SequencerPlayerBloc, SequencerState>(
              builder: (context, state) {
            final actionIcon =
                state.running ? Icon(Icons.stop) : Icon(Icons.play_arrow);

            return Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () =>
                          _onSetStepsClicked(context, state.steps?.length ?? 8),
                      child: Text("Steps " + state.steps?.length.toString()),
                    ),
                    MaterialButton(
                      onPressed: () => {},
                      child: Text(state.tempo.toString()),
                    ),
                    IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: () => {
                              context
                                  .bloc<SequencerPlayerBloc>()
                                  .add(StepSequenceForwardEvent())
                            }),
                    IconButton(
                        icon: actionIcon,
                        onPressed: () => {
                              context
                                  .bloc<SequencerPlayerBloc>()
                                  .add(ToggleSequencerEvent())
                            })
                  ],
                ),
                body: PadsSequencer());
          })));

  void _onSetStepsClicked(BuildContext context, int initSteps) async {
    int newStepsValue = await showDialog(
        context: context, builder: (context) => _buildStepsDialog(context, initSteps));

  }

  // TODO: Change to statefull widget and handle the result.
  Widget _buildStepsDialog(BuildContext context, int stepsCount) {
    double result = stepsCount.toDouble();

    return Dialog(
      child: Wrap(children: <Widget>[
        Container(
          alignment: null,
          padding: EdgeInsets.all(12.0),
          child: Column(children: <Widget>[
            Text("Set number of steps"),
            Slider(
              onChanged: (value) {
                result = value;
              },
              value: result,
              min: 1.0,
              max: 64.0,
            ),
            FlatButton(
              child: Text("Set"),
              onPressed: () {
                Navigator.of(context).pop(result);
              },
            )
          ]),
        )
      ]),
    );
  }
}
