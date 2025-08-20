// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:roboldo/models/user.dart';
import 'package:roboldo/services/user_service.dart';
import 'package:roboldo/screens/home_screen.dart';
import 'package:roboldo/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importação adicionada

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserAndNavigate();
  }

  Future<void> _checkUserAndNavigate() async {
    // Simula um tempo de carregamento para a splash screen
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final lastUserId = prefs.getString('last_user_id');

    User? user;
    if (lastUserId != null) {
      // Carrega o usuário se o ID do último usuário for encontrado
      user = await UserService.loadUser(lastUserId);
    }

    if (mounted) {
      if (user != null) {
        // Se o usuário existe, navega para a HomeScreen
        Navigator.of(context).pushReplacement(
          // Correção aqui: adicionado o operador !
          MaterialPageRoute(builder: (context) => HomeScreen(user: user!)),
        );
      } else {
        // Se o usuário não existe, navega para a LoginScreen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 150),
            SizedBox(height: 24),
            Text(
              'Roboldo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
