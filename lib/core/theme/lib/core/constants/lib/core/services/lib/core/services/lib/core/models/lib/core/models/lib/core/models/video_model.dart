class VideoModel {
  final String id;
  final String userId;
  final String title;
  final String videoUrl;
  final String category;
  final DateTime createdAt;

  VideoModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.videoUrl,
    required this.category,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'videoUrl': videoUrl,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      category: map['category'] ?? '',
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}
