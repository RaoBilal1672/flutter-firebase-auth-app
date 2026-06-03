import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F172A),
              Color(0xFF1E1B4B),
              Color(0xFF312E81),
            ],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 420,
                ),

                padding: const EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),

                  borderRadius: BorderRadius.circular(30),

                  border: Border.all(
                    color: Colors.white.withOpacity(0.15),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.15),
                      blurRadius: 40,
                      spreadRadius: 5,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Container(
                      height: 120,
                      width: 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF8B5CF6),
                            Color(0xFF3B82F6),
                          ],
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.40),
                            blurRadius: 30,
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'You are successfully logged in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD1D5DB),
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),

                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: Text(
                        authService.currentUser?.email ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    Container(
                      height: 58,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),

                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF8B5CF6),
                            Color(0xFF3B82F6),
                          ],
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 25,
                          ),
                        ],
                      ),

                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await authService.logout();

                          if (!context.mounted) return;

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                                (route) => false,
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),

                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),

                        label: const Text(
                          'LOGOUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}