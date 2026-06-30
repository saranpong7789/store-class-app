import 'package:flutter/material.dart';
import '../../widgets/glass_container.dart';

class VideoLibraryScreen extends StatelessWidget {
  const VideoLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Library'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0066FF).withOpacity(0.05),
              const Color(0xFFB8A7FF).withOpacity(0.05),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              GlassContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.video_library,
                      size: 64,
                      color: Color(0xFF0066FF),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Video Library',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text('Organize and manage your videos'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
