import 'package:flutter/material.dart';
import '../models/video_model.dart';

class VideoProvider extends ChangeNotifier {
  List<VideoModel> _videos = [];
  bool _isLoading = false;

  List<VideoModel> get videos => _videos;
  bool get isLoading => _isLoading;

  void addVideo(VideoModel video) {
    _videos.add(video);
    notifyListeners();
  }

  void removeVideo(String id) {
    _videos.removeWhere((v) => v.id == id);
    notifyListeners();
  }

  void updateVideo(VideoModel video) {
    final index = _videos.indexWhere((v) => v.id == video.id);
    if (index != -1) {
      _videos[index] = video;
      notifyListeners();
    }
  }

  List<VideoModel> searchVideos(String query) {
    return _videos
        .where((v) => v.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
