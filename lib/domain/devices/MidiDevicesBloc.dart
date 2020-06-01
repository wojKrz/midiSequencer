import 'package:flutter_midi_command/flutter_midi_command.dart';

class MidiDevicesBloc {
  Future<List<MidiDevice>> findMidiDevices() async {
    return await MidiCommand().devices;
  }

  void toggleConnection(MidiDevice device) {
    if (device.connected) {
      MidiCommand().disconnectDevice(device);
    } else {
      MidiCommand().connectToDevice(device);
    }
  }
}

final midiDevicesBloc = MidiDevicesBloc();
