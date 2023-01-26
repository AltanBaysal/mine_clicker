import 'package:mine_clicker/core/_core_exports.dart';

class SoundPlayer {
  final AudioPlayer audioPlayer = AudioPlayer();
  late final AudioCache _player;

  SoundPlayer({ReleaseMode? releaseMode}) {
    _player = AudioCache(fixedPlayer: audioPlayer);
    if (releaseMode != null) {
      audioPlayer.setReleaseMode(releaseMode);
    }
  }

  Future<void> play(
    String audio,
  ) async {
    final url = await _player.load(audio);
    audioPlayer.play(url.path, isLocal: true);
  }

  Future<void> playAndWait(
    String audio,
    Duration duration,
  ) async {
    play(audio);
    await Future.delayed(duration);
  }

  void pause() {
    audioPlayer.stop();
  }
}
