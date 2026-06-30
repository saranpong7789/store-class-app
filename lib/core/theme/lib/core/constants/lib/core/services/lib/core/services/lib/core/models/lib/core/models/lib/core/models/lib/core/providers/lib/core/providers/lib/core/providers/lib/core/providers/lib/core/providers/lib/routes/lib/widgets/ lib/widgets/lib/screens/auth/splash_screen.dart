import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../core/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (!mounted) return;
    
    final authProvider = context.read<AuthProvider>();
    
    if (authProvider.isAuthenticated) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0066FF).withOpacity(0.1),
              const Color(0xFFB8A7FF).withOpacity(0.1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.school,
                size: 80,
                color: Color(0xFF0066FF),
              ),
              const SizedBox(height: 20),
              const Text(
                'Store Class',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0066FF),
                ),
              ),
              const SizedBox(height: 40),
              const CircularProgressIndicator(
                color: Color(0xFF0066FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
