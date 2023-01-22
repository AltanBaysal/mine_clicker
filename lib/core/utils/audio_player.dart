import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  final _player = AudioCache();

  Future<void> play(String audio) async {
    _player.play(audio);
  }
}
