import 'package:flutter/material.dart';
import '../../widgets/glass_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
                    const CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your Profile',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text('Manage your personal information'),
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
