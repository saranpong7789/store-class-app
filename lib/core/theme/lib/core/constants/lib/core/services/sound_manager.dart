import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  static final SoundManager _instance = SoundManager._internal();
  late AudioPlayer _audioPlayer;
  bool _isMuted = false;

  factory SoundManager() {
    return _instance;
  }

  SoundManager._internal() {
    _audioPlayer = AudioPlayer();
  }

  bool get isMuted => _isMuted;

  void toggleMute() {
    _isMuted = !_isMuted;
  }

  Future<void> playButtonClick() async {
    if (!_isMuted) {
      try {
        await _audioPlayer.play(AssetSource('sounds/button_click.wav'));
      } catch (e) {
        print('Error playing sound: $e');
      }
    }
  }

  Future<void> playSuccess() async {
    if (!_isMuted) {
      try {
        await _audioPlayer.play(AssetSource('sounds/success.wav'));
      } catch (e) {
        print('Error playing sound: $e');
      }
    }
  }

  Future<void> playError() async {
    if (!_isMuted) {
      try {
        await _audioPlayer.play(AssetSource('sounds/error.wav'));
      } catch (e) {
        print('Error playing sound: $e');
      }
    }
  }

  Future<void> playUpload() async {
    if (!_isMuted) {
      try {
        await _audioPlayer.play(AssetSource('sounds/upload.wav'));
      } catch (e) {
        print('Error playing sound: $e');
      }
    }
  }
}
