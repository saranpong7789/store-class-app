import 'package:flutter/material.dart';
import '../services/sound_manager.dart';

class SoundProvider extends ChangeNotifier {
  final SoundManager _soundManager = SoundManager();

  bool get isMuted => _soundManager.isMuted;

  void toggleMute() {
    _soundManager.toggleMute();
    notifyListeners();
  }

  Future<void> playButtonClick() async {
    await _soundManager.playButtonClick();
  }

  Future<void> playSuccess() async {
    await _soundManager.playSuccess();
  }

  Future<void> playError() async {
    await _soundManager.playError();
  }

  Future<void> playUpload() async {
    await _soundManager.playUpload();
  }
}
