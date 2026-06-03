import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoading = false;

  Future<void> _signUp() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await _authService.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
              children: [
                const SizedBox(height: 40),

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
                        color: Colors.blue.withOpacity(0.4),
                        blurRadius: 30,
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.person_add_alt_1,
                    size: 55,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Sign up to get started',
                  style: TextStyle(
                    color: Color(0xFFD1D5DB),
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),

                    borderRadius: BorderRadius.circular(20),

                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),

                  child: TextField(
                    controller: _emailController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xFFD1D5DB),
                      ),

                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),

                      border: InputBorder.none,

                      contentPadding: EdgeInsets.symmetric(
                        vertical: 22,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),

                    borderRadius: BorderRadius.circular(20),

                    border: Border.all(
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),

                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Color(0xFFD1D5DB),
                      ),

                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),

                      border: InputBorder.none,

                      contentPadding: EdgeInsets.symmetric(
                        vertical: 22,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 25,
                      ),
                    ],
                  ),

                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signUp,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: _isLoading
                        ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                        : const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}