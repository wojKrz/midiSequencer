import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/sequence/SequencerBloc.dart';
import 'package:fluttermidisequencer/domain/sequencer/Note.dart';
import 'package:fluttermidisequencer/widget/common/TextInputDialog.dart';
import 'package:fluttermidisequencer/widget/keyboard/PianoKeyboard.dart';

class PadsSequencer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(children: <Widget>[
        BlocBuilder<SequencerPlayerBloc, SequencerState>(
            builder: (context, state) =>
                InkWell(onTap: () {
                  _onTitleClicked(context);
                }, child: Text(state.title))),
        OrientationBuilder(
            builder: (context, orientation) => GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: orientation == Orientation.portrait ? 4 : 8,
                  crossAxisSpacing: 16,
                  children: _buildPadsList(context, 8),
                  padding: const EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                ))
      ]));

  void _onTitleClicked(BuildContext context) async {
    String newTitle = await showSimpleTextInputDialog(context, "Set sequence title");
    context.bloc<SequencerPlayerBloc>().add(SetSequenceTitle(newTitle));
  }

  List<Widget> _buildPadsList(BuildContext context, int count) => List.generate(
      count,
      (index) => BlocBuilder<SequencerPlayerBloc, SequencerState>(
              builder: (context, state) {
            final step = state.steps[index];
            final isCurrent = index == state.currentStep;
            if (step.isOn) {
              if (isCurrent) {
                return _buildActivePlayedStepShape(context, index);
              } else {
                return _buildActiveStepShape(context, index);
              }
            } else {
              if (isCurrent) {
                return _buildInactivePlayedStepShape(context, index);
              } else {
                return _buildInactiveStateShape(context, index);
              }
            }
          }));

  //region Pad Shapes

  Widget _buildActiveStepShape(BuildContext context, int index) => FlatButton(
        onLongPress: () => {_onPadLongPressed(context, index)},
        onPressed: () => {_onPadClicked(context, index)},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red, width: 6)),
        color: Colors.red,
      );

  Widget _buildInactiveStateShape(BuildContext context, int index) =>
      FlatButton(
        onLongPress: () => {_onPadLongPressed(context, index)},
        onPressed: () => {_onPadClicked(context, index)},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red, width: 6)),
      );

  Widget _buildActivePlayedStepShape(BuildContext context, int index) =>
      FlatButton(
        onLongPress: () => {_onPadLongPressed(context, index)},
        onPressed: () => {_onPadClicked(context, index)},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.amber, width: 6)),
        color: Colors.amber,
      );

  Widget _buildInactivePlayedStepShape(BuildContext context, int index) =>
      FlatButton(
        onLongPress: () => {_onPadLongPressed(context, index)},
        onPressed: () => {_onPadClicked(context, index)},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.amber, width: 6)),
      );

  //endregion

  void _onPadLongPressed(BuildContext context, int padIndex) async {
    final note = await _getNoteFromKeyboard(context);

    context.bloc<SequencerPlayerBloc>().setNoteOnStep(note, padIndex);
  }

  void _onPadClicked(BuildContext context, int padIndex) =>
      context.bloc<SequencerPlayerBloc>().add(ToggleStepActiveEvent(padIndex));

  Future<Note> _getNoteFromKeyboard(BuildContext buildContext) async =>
      await Navigator.push(buildContext,
          MaterialPageRoute(builder: (context) => PianoKeyboard()));
}
