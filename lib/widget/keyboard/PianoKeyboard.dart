import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermidisequencer/sequencer/Note.dart';

class PianoKeyboard extends StatelessWidget {
  Function(int) _onNote(BuildContext context) => (int index) {
        final note = Note(60 + index);

        Navigator.pop(context, note);
      };

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Stack(children: <Widget>[
        Row(
          children: <Widget>[
            _createWhiteKey(60.0, 0, _onNote(context)),
            _createWhiteKey(60.0, 2, _onNote(context)),
            _createWhiteKey(60.0, 4, _onNote(context)),
            _createWhiteKey(60.0, 5, _onNote(context)),
            _createWhiteKey(60.0, 7, _onNote(context)),
            _createWhiteKey(60.0, 9, _onNote(context)),
            _createWhiteKey(60.0, 11, _onNote(context)),
          ],
        ),
        Positioned(
            top: 0.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(width: 30.0),
                _createBlackKey(60.0),
                _createBlackKey(60.0),
                Container(width: 60.0),
                _createBlackKey(60.0),
                _createBlackKey(60.0),
                _createBlackKey(60.0),
              ],
            ))
      ])));

  Widget _createWhiteKey(double keyWidth, int index, Function(int) callback) =>
      Container(
        width: keyWidth,
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: Material(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.white,
          child: InkWell(
            highlightColor: Colors.grey,
            onTap: () {},
            onTapDown: (_) => callback(index),
          ),
        ),
      );

  Widget _createBlackKey(double keyWidth) => Container(
        width: keyWidth,
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 2.0),
        child: Material(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          color: Colors.black,
        ),
      );
}
