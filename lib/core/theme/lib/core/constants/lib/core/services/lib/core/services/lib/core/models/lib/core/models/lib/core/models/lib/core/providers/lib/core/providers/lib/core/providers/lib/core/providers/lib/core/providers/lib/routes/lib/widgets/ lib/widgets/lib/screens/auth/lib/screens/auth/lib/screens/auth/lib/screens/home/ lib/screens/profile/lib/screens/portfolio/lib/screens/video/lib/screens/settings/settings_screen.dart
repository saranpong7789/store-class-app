import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/providers/auth_provider.dart';
import '../../core/providers/sound_provider.dart';
import '../../widgets/glass_container.dart';
import '../../widgets/glass_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
                    Consumer<SoundProvider>(
                      builder: (context, soundProvider, _) {
                        return SwitchListTile(
                          title: const Text('Sound Effects'),
                          subtitle: const Text('Enable or disable sound'),
                          value: !soundProvider.isMuted,
                          onChanged: (value) {
                            soundProvider.toggleMute();
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    GlassButton(
                      label: 'Logout',
                      backgroundColor: Colors.red,
                      onPressed: () async {
                        final soundProvider = context.read<SoundProvider>();
                        final authProvider = context.read<AuthProvider>();
                        
                        await soundProvider.playButtonClick();
                        await authProvider.signOut();
                        
                        if (context.mounted) {
                          context.go('/login');
                        }
                      },
                    ),
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
